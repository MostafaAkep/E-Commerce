import 'package:dio/dio.dart';
import 'package:e_commerce_app/features/home/data/models/product_model/product.dart';
import 'package:e_commerce_app/features/home/data/services/home_service.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'home_service_impl.g.dart';

@factoryMethod
@RestApi(baseUrl: 'https://accessories-eshop.runasp.net/')
abstract class HomeServiceImpl implements HomeService {
  factory HomeServiceImpl(Dio dio, {String baseUrl}) =
      _HomeServiceImpl;
  @override
  @GET('api/products')
  Future<Product> getProducts();
}
