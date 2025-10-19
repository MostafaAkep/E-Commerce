import 'package:e_commerce_app/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success({
    List<ProductEntity>? products,
    List<CategoryEntity>? categories,
  }) = _Success;
  const factory HomeState.error({required String error}) = _Error;
}
