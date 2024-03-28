import "package:http/http.dart";
import 'dart:core';
import 'package:http_client/src/interceptor/i_interceptor.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor implements IInterceptor {
  @override
  Future<Request> interceptRequest(Request request) async {
    ConsoleLog().debug("----*** start of request ***----");
    ConsoleLog().debug("request: ${request.url}");
    return request;
  }

  @override
  Future<Response> interceptResponse(Response response) async {
    ConsoleLog().debug("----*** start of response ***----");
    ConsoleLog().debug("response: ${response.body}");
    return response;
  }
}
