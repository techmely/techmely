import type { RepositoryPort } from "../../../../ddd/core/dist";
import type { UserEntity } from "../entities/user.entity";

export interface IUserRepository extends RepositoryPort<UserEntity> {}
