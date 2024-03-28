import "dart:convert";

import "package:http/http.dart";
import "package:http_client/src/client/method.dart";
import "package:http_client/src/extensions/request.dart";

extension BaseRequestCopy on BaseRequest {
  BaseRequest copy({
    Method? method,
    Uri? url,
    Map<String, String>? headers,
    bool? followRedirects,
    int? maxRedirects,
    bool? persistentConnection,
    dynamic body,
    Encoding? encoding,
    List<MultipartFile>? files,
  }) {
    return RequestCopy(this as Request).copy(
      method: method?.asString,
      url: url,
      headers: headers,
      body: body,
      encoding: encoding,
      followRedirects: followRedirects,
      maxRedirects: maxRedirects,
      persistentConnection: persistentConnection,
    );
  }
}
