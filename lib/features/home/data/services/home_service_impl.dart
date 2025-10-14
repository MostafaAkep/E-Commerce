import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/networking/api_constants.dart';
import 'package:e_commerce_app/features/home/data/models/product_model/product.dart';
import 'package:e_commerce_app/features/home/data/services/home_service.dart';
import 'package:retrofit/retrofit.dart';

part 'home_service_impl.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeServiceImpl implements HomeService {
  factory HomeServiceImpl(Dio dio, {String baseUrl}) =
      _HomeServiceImpl;

  @override
  @GET(ApiConstants.products)
  Future<Product> getProducts();
}
