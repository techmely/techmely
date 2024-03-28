import "package:http/http.dart";

abstract class IInterceptor {
  Future<Request> interceptRequest(Request request);

  Future<Response> interceptResponse(Response response);
}
