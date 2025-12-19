import 'package:dio/dio.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) {
    // Optional: add token / headers
    // options.headers["Authorization"] = "Bearer token";
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String message = 'Something went wrong';

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout';
        break;

      case DioExceptionType.badResponse:
        message = err.response?.data['error'] ??
            err.response?.statusMessage ??
            'Server error';
        break;

      case DioExceptionType.cancel:
        message = 'Request cancelled';
        break;

      default:
        message = 'No internet connection';
    }

    //Create new DioException with custom message
    final customError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: message,
    );

    //rethrow error
    handler.reject(customError);
  }
}
