class APIResponse<T> {
  final T? data;
  final int? statusCode;
  final dynamic error;
  final String? message;
  final String? accessToken;
  final bool? success;
  final String? errorCode;
  APIResponse(
      {this.data,
      this.error,
      this.success,
      this.statusCode,
      this.message,
      this.errorCode,
      this.accessToken});
}
