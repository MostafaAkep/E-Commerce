import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryUseCase {
  final HomeRepository _repository;

  CategoryUseCase(this._repository);

  Future<ApiResult<List<CategoryEntity>>> call() async {
    return await _repository.getCategory();
  }
}
