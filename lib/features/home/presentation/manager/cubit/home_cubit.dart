import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce_app/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/category_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/product_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;
  final CategoryUseCase categoryUseCase;

  HomeCubit(this.getProductsUseCase, this.categoryUseCase)
    : super(const HomeState.initial());

  List<ProductEntity>? _products;
  List<CategoryEntity>? _categories;

  Future<void> getProducts() async {
    emit(const HomeState.loading());
    final result = await getProductsUseCase.call();
    result.when(
      success: (products) {
        _products = [products];
        _emitSuccessStateIfReady();
      },
      failure: (error) {
        emit(HomeState.error(error: error.apiErrorModel.message));
      },
    );
  }

  Future<void> getCategories() async {
    emit(const HomeState.loading());
    final result = await categoryUseCase.call();
    result.when(
      success: (categories) {
        if (categories.isEmpty) {
          emit(const HomeState.error(error: "No categories found."));
        } else {
          _categories = categories;
          _emitSuccessStateIfReady();
        }
      },
      failure: (error) {
        emit(HomeState.error(error: error.apiErrorModel.message));
      },
    );
  }

  void _emitSuccessStateIfReady() {
    if (_products != null && _categories != null) {
      emit(
        HomeState.success(
          products: _products,
          categories: _categories,
        ),
      );
    }
  }
}
