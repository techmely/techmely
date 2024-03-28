import "package:http/http.dart";

extension ResponseCopy on Response {
  Response copy({
    String? body,
    int? statusCode,
    BaseRequest? request,
    Map<String, String>? headers,
    bool? isRedirect,
    bool? persistentConnection,
    String? reasonPhrase,
  }) =>
      Response(body ?? this.body, statusCode ?? this.statusCode,
          request: request ?? this.request,
          headers: headers ?? this.headers,
          isRedirect: isRedirect ?? this.isRedirect,
          persistentConnection:
              persistentConnection ?? this.persistentConnection,
          reasonPhrase: reasonPhrase ?? this.reasonPhrase);
}
