import "package:http/http.dart";
import 'package:techmely_app/features/preferences/infra/http/extensions/request.dart';
import 'package:techmely_app/features/preferences/infra/http/interceptor/i_interceptor.dart';
import 'dart:core';

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
