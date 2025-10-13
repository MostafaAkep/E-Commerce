import 'package:dio/dio.dart';
import 'package:e_commerce_app/features/home/data/data_source/home_data_source.dart';
import 'package:e_commerce_app/features/home/data/models/product_model/product.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  final Dio dio;

  HomeDataSourceImpl(this.dio);

  @override
  Future<Product> getProducts() async {
    final response = await dio.request(
      'https://accessories-eshop.runasp.net/api/products',
      data: {
        "searchTerm": "",
        "category": "",
        "minPrice": 438,
        "maxPrice": 5118,
        "isInStock": true,
        "sortBy": "",
        "sortOrder": "",
        "page": 1,
        "pageSize": 10,
      },
      options: Options(
        method: 'GET',
        headers: {'Content-Type': 'application/json'},
      ),
    );
    return response.data;
  }
}
