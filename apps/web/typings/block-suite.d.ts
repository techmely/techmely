import type { ContentParser } from "@blocksuite/blocks/content-parser";
import std from "@blocksuite/blocks/std";
import type { EditorContainer } from "@blocksuite/editor";
import type { BlockSchema, Page, Workspace } from "@blocksuite/store";
import type { z } from "zod";

declare global {
  interface Window {
    // Block Suite Editor
    editor: EditorContainer;
    page: Page;
    workspace: Workspace;
    blockSchemas: z.infer<typeof BlockSchema>[];
    ContentParser: typeof ContentParser;
    Y: typeof Workspace.Y;
    std: typeof std;
  }
}
