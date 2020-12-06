import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  String _errorCode;
  String _errorMessage = "";

  ServerError.withError({DioError error}) {
    _handleError(error);
  }

  String getErrorCode() => _errorCode;
  String getErrorMessage() => _errorMessage;

  _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.SEND_TIMEOUT:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        _errorMessage = "Connection timeout";
        break;
      case DioErrorType.RESPONSE:
          _errorMessage = error.response.data['message'];
          _errorCode = error.response.data['code'];
        break;
      case DioErrorType.CANCEL:
        _errorMessage = "Canceled";
        break;
      case DioErrorType.DEFAULT:
        _errorMessage = "Something wrong";
        break;
    }
    return _errorMessage;
  }
}
