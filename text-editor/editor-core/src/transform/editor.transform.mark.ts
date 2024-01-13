import { Fragment, type Mark, MarkType, type NodeType, Slice } from "techmely-editor-model";

import { AddMarkStep, RemoveMarkStep } from "./mark_step";
import { ReplaceStep } from "./replace_step";
import type { Step } from "./step";
import type { Transform } from "./transform";

export function addMark(tr: Transform, from: number, to: number, mark: Mark) {
  const removed: Step[] = [],
    added: Step[] = [];
  let removing: RemoveMarkStep | undefined, adding: AddMarkStep | undefined;
  tr.doc.nodesBetween(from, to, (node, pos, parent) => {
    if (!node.isInline) return;
    const marks = node.marks;
    if (!mark.isInSet(marks) && parent!.type.allowsMarkType(mark.type)) {
      const start = Math.max(pos, from),
        end = Math.min(pos + node.nodeSize, to);
      const newSet = mark.addToSet(marks);

      for (let i = 0; i < marks.length; i++) {
        if (!marks[i].isInSet(newSet)) {
          if (removing && removing.to === start && removing.mark.eq(marks[i]))
            (removing as any).to = end;
          else removed.push((removing = new RemoveMarkStep(start, end, marks[i])));
        }
      }

      if (adding && adding.to === start) (adding as any).to = end;
      else added.push((adding = new AddMarkStep(start, end, mark)));
    }
  });

  removed.forEach((s) => tr.step(s));
  added.forEach((s) => tr.step(s));
}

export function removeMark(tr: Transform, from: number, to: number, mark?: Mark | MarkType | null) {
  let matched: { style: Mark; from: number; to: number; step: number }[] = [],
    step = 0;
  tr.doc.nodesBetween(from, to, (node, pos) => {
    if (!node.isInline) return;
    step++;
    let toRemove = null;
    if (mark instanceof MarkType) {
      let set = node.marks,
        found;
      while ((found = mark.isInSet(set))) {
        (toRemove || (toRemove = [])).push(found);
        set = found.removeFromSet(set);
      }
    } else if (mark) {
      if (mark.isInSet(node.marks)) toRemove = [mark];
    } else {
      toRemove = node.marks;
    }
    if (toRemove && toRemove.length) {
      const end = Math.min(pos + node.nodeSize, to);
      for (let i = 0; i < toRemove.length; i++) {
        let style = toRemove[i],
          found;
        for (let j = 0; j < matched.length; j++) {
          const m = matched[j];
          if (m.step === step - 1 && style.eq(matched[j].style)) found = m;
        }
        if (found) {
          found.to = end;
          found.step = step;
        } else {
          matched.push({ style, from: Math.max(pos, from), to: end, step });
        }
      }
    }
  });
  matched.forEach((m) => tr.step(new RemoveMarkStep(m.from, m.to, m.style)));
}

export function clearIncompatible(
  tr: Transform,
  pos: number,
  parentType: NodeType,
  match = parentType.contentMatch,
) {
  const node = tr.doc.nodeAt(pos)!;
  let replSteps: Step[] = [],
    cur = pos + 1;
  for (let i = 0; i < node.childCount; i++) {
    const child = node.child(i),
      end = cur + child.nodeSize;
    const allowed = match.matchType(child.type);
    if (!allowed) {
      replSteps.push(new ReplaceStep(cur, end, Slice.empty));
    } else {
      match = allowed;
      for (let j = 0; j < child.marks.length; j++)
        if (!parentType.allowsMarkType(child.marks[j].type))
          tr.step(new RemoveMarkStep(cur, end, child.marks[j]));

      if (child.isText && !parentType.spec.code) {
        let m,
          newline = /\r?\n|\r/g,
          slice;
        while ((m = newline.exec(child.text!))) {
          if (!slice)
            slice = new Slice(
              Fragment.from(parentType.schema.text(" ", parentType.allowedMarks(child.marks))),
              0,
              0,
            );
          replSteps.push(new ReplaceStep(cur + m.index, cur + m.index + m[0].length, slice));
        }
      }
    }
    cur = end;
  }
  if (!match.validEnd) {
    const fill = match.fillBefore(Fragment.empty, true);
    tr.replace(cur, cur, new Slice(fill!, 0, 0));
  }
  for (let i = replSteps.length - 1; i >= 0; i--) tr.step(replSteps[i]);
}
