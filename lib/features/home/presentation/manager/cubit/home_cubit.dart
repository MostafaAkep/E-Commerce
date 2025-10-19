import 'package:e_commerce_app/core/networking/api_result.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/product_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;

  HomeCubit(this.getProductsUseCase)
    : super(const HomeState.initial());

  Future<void> getProducts() async {
    emit(const HomeState.loading());
    final result = await getProductsUseCase.call();
    result.when(
      success: (products) {
        emit(HomeState.success(products: [products]));
      },
      failure: (error) {
        emit(HomeState.error(error: error.apiErrorModel.message));
      },
    );
  }
}
