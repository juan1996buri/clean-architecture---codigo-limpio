class ResponseGeneric<T> {
  ResponseResult responseResult;
  T? data;
  ResponseGeneric({
    required this.responseResult,
    this.data,
  });
}

class ResponseResult {
  final String message;
  final ResponseStatus responseStatus;
  ResponseResult({
    required this.message,
    required this.responseStatus,
  });
}

enum ResponseStatus { init, loading, success, error }
