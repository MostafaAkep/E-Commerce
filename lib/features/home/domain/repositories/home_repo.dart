import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';

abstract class HomeRepository {
  Future<ProductEntity> getProducts();
}
