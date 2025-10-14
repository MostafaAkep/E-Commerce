import 'package:dio/dio.dart';
import 'package:e_commerce_app/features/home/data/data_source/home_data_source.dart';
import 'package:e_commerce_app/features/home/data/models/product_model/product.dart';
import 'package:e_commerce_app/features/home/data/services/home_service_impl.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  final Dio dio;
  final HomeServiceImpl homeServiceImpl;

  HomeDataSourceImpl(this.dio, this.homeServiceImpl);

  @override
  Future<Product> getProducts() {
    return homeServiceImpl.getProducts();
  }
}
