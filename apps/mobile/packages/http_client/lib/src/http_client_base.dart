// TODO: Put public facing types in this file.

import 'package:http_client/src/client/intercepted_client.dart';
import 'package:http_client/src/interceptor/logger_interceptor.dart';
// Checks if you are awesome. Spoiler: you are.
class ClientManager {
  InterceptedClient? http_client;

  init() {
    if (http_client == null) {
      http_client =
          InterceptedClient.build(interceptors: [LoggerInterceptor()]);
    }
  }
}
