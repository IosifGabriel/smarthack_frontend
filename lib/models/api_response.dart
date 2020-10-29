class ApiResponse<T> {
  T data;
  bool error;
  int errorCode;
  String errorMessage;

  ApiResponse({
    this.data,
    this.error = false,
    this.errorCode,
    this.errorMessage,
  });
}
