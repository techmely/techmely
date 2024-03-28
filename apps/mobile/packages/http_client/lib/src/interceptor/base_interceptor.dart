import "package:http/http.dart";
import 'package:http_client/src/extensions/request.dart';
import 'dart:core';

import 'package:http_client/src/interceptor/i_interceptor.dart';

class BaseInterceptor implements IInterceptor {
  final String baseUrl;
  BaseInterceptor(this.baseUrl);

  @override
  Future<Request> interceptRequest(Request request) async {
    final newUrl = Uri.parse(baseUrl + request.url.toString());
    request = request.copy(method: request.method, url: newUrl);
    return request;
  }

  @override
  Future<Response> interceptResponse(Response response) async {
    return response;
  }
}
