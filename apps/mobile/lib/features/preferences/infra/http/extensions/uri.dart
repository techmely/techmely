import 'dart:convert';

import "package:http/src/utils.dart";

extension AddParameters on Uri {
  /// Returns a new `Uri` instance based on `this` and adds [parameters].
  Uri addParameters(Map<String, String>? parameters, Encoding? encoding) {
    if (parameters == null) return this;
    final paramsToString =
        mapToQuery(parameters, encoding: encoding ?? const Utf8Codec());
    return Uri.parse("$path?$paramsToString");
  }
}
