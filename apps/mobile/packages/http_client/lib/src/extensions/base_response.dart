import 'dart:io';

import 'package:http/http.dart';
import 'package:http_client/src/extensions/response.dart';

extension BaseResponseCopy on BaseResponse {
  BaseResponse copy({
    int? statusCode,
    BaseRequest? request,
    Map<String, String>? headers,
    bool? isRedirect,
    bool? persistentConnection,
    String? reasonPhrase,
    String? body,
    Stream<List<int>>? stream,
    int? contentLength,
    HttpClientResponse? inner,
  }) =>
      ResponseCopy(this as Response).copy(
          statusCode: statusCode,
          body: body,
          request: request,
          headers: headers,
          isRedirect: isRedirect,
          persistentConnection: persistentConnection,
          reasonPhrase: reasonPhrase);
}
