import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';

abstract class HomeRepository {
  Future<ApiResult<ProductEntity>> getProducts();
}
