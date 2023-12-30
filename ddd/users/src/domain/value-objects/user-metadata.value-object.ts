import { invariant } from "@techmely/utils";
import {
  ArgumentInvalidException,
  ArgumentNotProvidedException,
  ValueObject,
} from "../../../../ddd/core/dist";

export interface IUserMetadata {
  openPlatform: string;
  utmCampaign: string;
  utmMedium: string;
  utmSource: string;
}

export class UserMetadata extends ValueObject<IUserMetadata> {
  protected validate(props: IUserMetadata): void {
    const USER_METADATA_LENGTH = 4;
    const niceUserKeyMetadata = Object.keys(props).length === USER_METADATA_LENGTH;
    invariant(
      niceUserKeyMetadata,
      new ArgumentNotProvidedException("User metadata keys not correct"),
    );
    const niceValueUserMetadata =
      Object.values(props).filter(Boolean).length === USER_METADATA_LENGTH;
    invariant(
      niceValueUserMetadata,
      new ArgumentInvalidException("User metadata values not correct"),
    );
  }
}
