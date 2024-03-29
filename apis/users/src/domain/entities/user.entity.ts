import { AggregateRoot, UniqueEntityID } from "@techmely/api-core";
import { UserCreatedDomainEvent } from "../events/user-created.event";
import { type CreateUserProps, type UserProps, UserRoles, UserStatus } from "./user.types";

export class UserEntity extends AggregateRoot<UserProps> {
  static create(createProps: CreateUserProps) {
    const id = new UniqueEntityID();
    const props: UserProps = { role: UserRoles.MEMBER, status: UserStatus.ACTIVE, ...createProps };
    const user = new UserEntity({ id, props });
    user.addEvent(
      new UserCreatedDomainEvent({
        aggregateId: id,
        ...props,
        ...props?.metadata?.raw(),
        ...props?.provider?.raw(),
      }),
    );
    return user;
  }

  validate(): void {
    throw new Error("Method not implemented.");
  }
}
