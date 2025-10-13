import 'package:e_commerce_app/features/home/data/models/product_model/product.dart';

abstract class HomeService {
  Future<Product> getProducts();
}
