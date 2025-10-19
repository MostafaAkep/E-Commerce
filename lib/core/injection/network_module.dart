import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/api_constants.dart';
import 'package:e_commerce_app/core/networking/auth_interceptor.dart';
import 'package:e_commerce_app/features/home/data/services/home_service.dart';
import 'package:e_commerce_app/features/home/data/services/home_service_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl))
    ..interceptors.add(
      AuthInterceptor(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2ZGQ1ODBmOC0xMmIwLTRkMzctYmIxOS0wOGRlMDk3OTY3ZTkiLCJqdGkiOiI2Y2VjMWQ5YS02ZjBjLTQ3NDktYWZjYy00ZmU3YjRkMTY1MWQiLCJlbWFpbCI6Im1tb3N0YWZhYmluQGdtYWlsLmNvbSIsIm5hbWUiOiJkYWRhIGRhYWQiLCJyb2xlcyI6IiIsInBpY3R1cmUiOiIiLCJleHAiOjE3NjExMjcyOTYsImlzcyI6ImVzaG9wLm5ldCIsImF1ZCI6ImVzaG9wLm5ldCJ9.ocru0Of5yp1iwoSkmXhhxjkZe5crlRaVuMLEdTiHdaw',
      ),
    )
    ..interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );

  // Injectable will call this to create and register HomeServiceImpl
  @lazySingleton
  HomeService homeService(Dio dio) => HomeServiceImpl(dio);
}
