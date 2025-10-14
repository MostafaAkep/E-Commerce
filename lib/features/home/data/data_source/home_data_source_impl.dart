import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/injection/injection.dart';
import 'package:e_commerce_app/features/home/data/data_source/home_data_source.dart';
import 'package:e_commerce_app/features/home/data/models/product_model/product.dart';
import 'package:e_commerce_app/features/home/data/services/home_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  final Dio dio;
  HomeService homeService = getIt<HomeService>();

  HomeDataSourceImpl(this.dio, this.homeService);

  @override
  Future<Product> getProducts() {
    return homeService.getProducts();
  }
}
