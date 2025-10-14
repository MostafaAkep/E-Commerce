import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/api_constants.dart';
import 'package:e_commerce_app/features/home/data/services/home_service.dart';
import 'package:e_commerce_app/features/home/data/services/home_service_impl.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio() => Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  // Injectable will call this to create and register HomeServiceImpl
  @lazySingleton
  HomeService homeService(Dio dio) => HomeServiceImpl(dio);
}
