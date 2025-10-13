import 'package:e_commerce_app/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';
import '../entities/product_entity.dart';

@lazySingleton
class GetProductsUseCase {
  final HomeRepository repository;

  GetProductsUseCase(this.repository);

  Future<ProductEntity> call() async {
    return await repository.getProducts();
  }
}
