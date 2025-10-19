import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../entities/product_entity.dart';

@lazySingleton
class GetProductsUseCase {
  final HomeRepository repository;

  GetProductsUseCase(this.repository);

  Future<ApiResult<ProductEntity>> call() async {
    return await repository.getProducts();
  }
}
