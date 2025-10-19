import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';

enum ApiErrorType {
  noContent(201, ApiErrors.noContent),
  badRequest(400, ApiErrors.badRequestError),
  forbidden(403, ApiErrors.forbiddenError),
  unauthorized(401, ApiErrors.unauthorizedError),
  notFound(404, ApiErrors.notFoundError),
  internalServerError(500, ApiErrors.internalServerError),
  connectTimeout(-1, ApiErrors.timeoutError),
  cancel(-2, ApiErrors.defaultError),
  receiveTimeout(-3, ApiErrors.timeoutError),
  sendTimeout(-4, ApiErrors.timeoutError),
  cacheError(-5, ApiErrors.cacheError),
  noInternetConnection(-6, ApiErrors.noInternetError),
  defaultError(-7, ApiErrors.defaultError);

  final int statusCode;
  final String message;

  const ApiErrorType(this.statusCode, this.message);

  ApiErrorModel getFailure() {
    return ApiErrorModel(statusCode: statusCode, message: message);
  }
}

extension DioExceptionTypeExtension on DioExceptionType {
  ApiErrorType getApiErrorType() {
    switch (this) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorType.connectTimeout;
      case DioExceptionType.sendTimeout:
        return ApiErrorType.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return ApiErrorType.receiveTimeout;
      case DioExceptionType.badResponse:
        // This case will be handled in _handleError to parse the actual API error model
        return ApiErrorType.defaultError;
      case DioExceptionType.cancel:
        return ApiErrorType.cancel;
      case DioExceptionType.connectionError:
        return ApiErrorType.noInternetConnection;
      case DioExceptionType.badCertificate:
        return ApiErrorType.defaultError;
      case DioExceptionType.unknown:
        return ApiErrorType.defaultError;
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleError(error);
    } else {
      apiErrorModel = ApiErrorType.defaultError.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  final apiErrorType = error.type.getApiErrorType();
  if (apiErrorType == ApiErrorType.defaultError &&
      error.response != null) {
    if (error.response?.data != null) {
      return ApiErrorModel.fromJson(error.response!.data);
    }
  }
  return apiErrorType.getFailure();
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
