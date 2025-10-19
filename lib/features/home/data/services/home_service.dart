import 'package:e_commerce_app/features/home/data/models/category_model/categorys.dart';
import 'package:e_commerce_app/features/home/data/models/product_model/product.dart';

abstract class HomeService {
  Future<Product> getProducts();
  Future<Categorys> getCategory();
}
