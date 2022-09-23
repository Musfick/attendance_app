import 'package:dio/dio.dart';

class DioException implements Exception {
  late String errorMessage;

  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = 'Request to the server was cancelled.';
        break;
      case DioErrorType.connectTimeout:
        errorMessage = 'Connection timed out.';
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred.';
        break;
      case DioErrorType.sendTimeout:
        errorMessage = 'Request send timeout.';
        break;
      case DioErrorType.response:
        errorMessage = _handleStatusCode(dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          errorMessage = 'No Internet.';
          break;
        }
        errorMessage = 'Unexpected error occurred.';
        break;
      default:
        errorMessage = 'Something went wrong';
        break;
    }
  }

  String _handleStatusCode(int? statusCode, dynamic) {
    switch (statusCode) {
      case 400:
        return dynamic['message'] ?? 'Bad request.';
      case 401:
        return dynamic['message'] ?? 'Authentication failed.';
      case 403:
        return dynamic['message'] ?? 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return dynamic['message'] ?? 'The requested resource does not exist.';
      case 405:
        return dynamic['message'] ?? 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 415:
        return dynamic['message'] ?? 'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        return dynamic['message'] ?? 'Data validation failed.';
      case 429:
        return dynamic['message'] ?? 'Too many requests.';
      case 500:
        return dynamic['message'] ?? 'Internal server error.';
      default:
        return 'Oops something went wrong!';
    }
  }

  @override
  String toString() => errorMessage;
}