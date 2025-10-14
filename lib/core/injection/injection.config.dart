// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:e_commerce_app/core/injection/network_module.dart' as _i743;
import 'package:e_commerce_app/features/home/data/data_source/home_data_source.dart'
    as _i315;
import 'package:e_commerce_app/features/home/data/data_source/home_data_source_impl.dart'
    as _i885;
import 'package:e_commerce_app/features/home/data/services/home_service.dart'
    as _i51;
import 'package:e_commerce_app/features/home/domain/repositories/home_repo.dart'
    as _i726;
import 'package:e_commerce_app/features/home/domain/repositories/home_repo_impl.dart'
    as _i827;
import 'package:e_commerce_app/features/home/domain/use_cases/product_use_case.dart'
    as _i250;
import 'package:e_commerce_app/features/home/presentation/manager/cubit/home_cubit.dart'
    as _i554;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio());
    gh.lazySingleton<_i51.HomeService>(
      () => networkModule.homeService(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i315.HomeDataSource>(
      () => _i885.HomeDataSourceImpl(gh<_i361.Dio>(), gh<_i51.HomeService>()),
    );
    gh.lazySingleton<_i726.HomeRepository>(
      () => _i827.HomeRepositoryImpl(gh<_i315.HomeDataSource>()),
    );
    gh.lazySingleton<_i250.GetProductsUseCase>(
      () => _i250.GetProductsUseCase(gh<_i726.HomeRepository>()),
    );
    gh.factory<_i554.HomeCubit>(
      () => _i554.HomeCubit(gh<_i250.GetProductsUseCase>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i743.NetworkModule {}
