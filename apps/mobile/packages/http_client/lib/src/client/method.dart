enum Method {
  GET,
  POST,
  PUT,
  DELETE
}
extension MethodToString on Method {
  String get asString  {
    switch (this) {
      case Method.GET:
        return "GET";
      case Method.POST:
        return "POST";
      case Method.PUT:
        return "PUT";
      case Method.DELETE:
        return "DELETE";
    }
  }
}
