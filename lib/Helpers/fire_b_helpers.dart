class FAuthResponse {
  final String message;
  final dynamic content;
  final bool isSuccess;

  FAuthResponse({
    this.message = '',
    this.content,
    this.isSuccess = false,
  });
}

class FDbResponse {
  final String message;
  final dynamic content;
  final bool isSuccess;

  FDbResponse({
    this.message = '',
    this.isSuccess = false,
    this.content,
  });
}
