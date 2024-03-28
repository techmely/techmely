import "package:http/http.dart";
import 'package:techmely_app/features/preferences/infra/http/interceptor/i_interceptor.dart';
import 'dart:core';
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
