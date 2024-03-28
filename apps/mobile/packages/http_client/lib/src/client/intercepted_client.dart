import "dart:convert";

import "package:http/http.dart";
import "package:http_client/src/client/method.dart";
import "package:http_client/src/extensions/base_request.dart";
import "package:http_client/src/extensions/base_response.dart";
import "package:http_client/src/extensions/uri.dart";
import "package:http_client/src/interceptor/i_interceptor.dart";

class InterceptedClient extends BaseClient {
  final List<IInterceptor> interceptors;

  late Client _client;

  InterceptedClient._internal({
    required this.interceptors,
    Client? client,
  }) : _client = client ?? Client();

  factory InterceptedClient.build({
    required List<IInterceptor> interceptors,
    Client? client,
  }) =>
      InterceptedClient._internal(
        interceptors: interceptors,
        client: client,
      );

  @override
  Future<Response> get(
    Uri url, {
    Map<String, String>? headers,
    Map<String, String>? params,
  }) async =>
      (await sendUnstreamed(
          url: url,
          method: Method.GET,
          headers: headers,
          params: params)) as Response;

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Map<String, String>? params,
    Object? body,
    Encoding? encoding,
  }) async =>
      (await sendUnstreamed(
          url: url,
          method: Method.POST,
          headers: headers,
          encoding: encoding,
          body: body,
          params: params)) as Response;

  @override
  Future<Response> put(
    Uri url, {
    Map<String, String>? headers,
    Map<String, String>? params,
    Object? body,
    Encoding? encoding,
  }) async =>
      (await sendUnstreamed(
          url: url,
          method: Method.PUT,
          headers: headers,
          encoding: encoding,
          body: body,
          params: params)) as Response;

  @override
  Future<Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Map<String, String>? params,
    Object? body,
    Encoding? encoding,
  }) async =>
      (await sendUnstreamed(
          url: url,
          method: Method.DELETE,
          headers: headers,
          encoding: encoding,
          body: body,
          params: params)) as Response;

  // WARNING: DO NOT USE THIS
  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    final response = await _request(request, isStream: true);
    final interceptedResponse = await interceptResponse(response);
    return interceptedResponse as StreamedResponse;
  }

  Future<BaseResponse> sendUnstreamed({
    required Method method,
    required Uri url,
    Map<String, String>? headers,
    Map<String, String>? params,
    Object? body,
    Encoding? encoding,
  }) async {
    url = url.addParameters(params,encoding);

    Request request = Request(method.asString, url);
    if (headers != null) request.headers.addAll(headers);
    if (encoding != null) request.encoding = encoding;
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError('Invalid request body "$body".');
      }
    }

    var response = await _request(request);
    final interceptedResponse = await interceptResponse(response);
    return interceptedResponse;
  }

  Future<BaseRequest> interceptRequest(BaseRequest request) async {
    BaseRequest interceptedRequest = request.copy();
    for (IInterceptor interceptor in interceptors) {
      interceptedRequest =
          await interceptor.interceptRequest(interceptedRequest as Request);
    }
    return interceptedRequest;
  }

  Future<BaseResponse> interceptResponse(BaseResponse response) async {
    BaseResponse interceptedResponse = response.copy();
    for (IInterceptor interceptor in interceptors) {
      interceptedResponse =
          await interceptor.interceptResponse(interceptedResponse as Response);
    }
    return interceptedResponse;
  }

  Future<BaseResponse> _request(BaseRequest request,
      {bool isStream = false}) async {
    BaseResponse response;
    try {
      final interceptedRequest = await interceptRequest(request);
      final stream = await _client.send(interceptedRequest);
      response = isStream ? stream : await Response.fromStream(stream);
    } on Exception {
      // TODO: implement retry
      rethrow;
    }
    return response;
  }

  @override
  void close() {

    _client.close();
  }
}
