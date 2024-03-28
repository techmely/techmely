import "dart:convert";

import "package:http/http.dart";

extension RequestCopy on Request {
  Request copy({
    String? method,
    Uri? url,
    Map<String, String>? headers,
    String? body,
    List<int>? bodyBytes,
    Encoding? encoding,
    bool? followRedirects,
    int? maxRedirects,
    bool? persistentConnection,
    Map<String, String>? bodyFields,
  }) {
    return Request(
      method ?? this.method,
      url ?? this.url,
    )
      ..body = body ?? this.body
      ..headers.addAll(headers ?? this.headers)
      ..encoding = encoding ?? this.encoding
      ..followRedirects = followRedirects ?? this.followRedirects
      ..maxRedirects = maxRedirects ?? this.maxRedirects
      ..persistentConnection = persistentConnection ?? this.persistentConnection;
  }
}
