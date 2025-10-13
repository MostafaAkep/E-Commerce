import 'package:e_commerce_app/features/home/data/data_source/home_data_source.dart';
import 'package:e_commerce_app/features/home/data/mappers/product_mapper.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<ProductEntity> getProducts() async {
    final model = await remoteDataSource.getProducts();
    return model.toEntity();
  }
}
