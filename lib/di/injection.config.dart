// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/network/dio_client.dart' as _i393;
import '../core/network/interceptors/error_interceptor.dart' as _i299;
import '../core/network/interceptors/logging_interceptor.dart' as _i1048;
import '../features/home/data/datasources/category_remote_datasource.dart'
    as _i902;
import '../features/home/data/repositories/category_repository_impl.dart'
    as _i106;
import '../features/home/data/services/user_service.dart' as _i813;
import '../features/home/domain/repositories/category_repository.dart' as _i236;
import '../features/home/domain/use_cases/get_categories_usecase.dart' as _i807;
import '../features/home/presentation/blocs/category_bloc.dart' as _i479;
import '../features/home/presentation/blocs/user_bloc.dart' as _i731;
import '../features/nutrition/data/datasources/fruit_remote_datasource.dart'
    as _i392;
import '../features/nutrition/data/repositories/fruit_repository_impl.dart'
    as _i618;
import '../features/nutrition/domain/repositories/fruit_repository.dart'
    as _i874;
import '../features/nutrition/domain/use_cases/get_all_fruits_usecase.dart'
    as _i698;
import '../features/nutrition/presentation/cubits/nutrition_tracker_cubit.dart'
    as _i143;
import '../features/search/data/datasources/recipe_remote_datasource.dart'
    as _i56;
import '../features/search/data/repositories/recipe_repository_impl.dart'
    as _i816;
import '../features/search/domain/repositories/recipe_repository.dart' as _i376;
import '../features/search/domain/use_cases/filter_by_category_usecase.dart'
    as _i689;
import '../features/search/domain/use_cases/search_recipes_usecase.dart'
    as _i953;
import '../features/search/presentation/blocs/recipe_list_bloc.dart' as _i264;
import '../features/search/presentation/cubits/voice_search_cubit.dart'
    as _i577;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt $initGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i299.ErrorInterceptor>(() => _i299.ErrorInterceptor());
    gh.factory<_i1048.LoggingInterceptor>(() => _i1048.LoggingInterceptor());
    gh.factory<_i577.VoiceSearchCubit>(() => _i577.VoiceSearchCubit());
    gh.lazySingleton<_i813.UserService>(() => _i813.UserService());
    gh.lazySingleton<_i393.DioClient>(
      () => _i393.DioClient(
        loggingInterceptor: gh<_i1048.LoggingInterceptor>(),
        errorInterceptor: gh<_i299.ErrorInterceptor>(),
      ),
    );
    gh.lazySingleton<_i392.FruitRemoteDataSource>(
      () => _i392.FruitRemoteDataSourceImpl(gh<_i393.DioClient>()),
    );
    gh.factory<_i731.UserBloc>(() => _i731.UserBloc(gh<_i813.UserService>()));
    gh.lazySingleton<_i56.RecipeRemoteDataSource>(
      () => _i56.RecipeRemoteDataSourceImpl(gh<_i393.DioClient>()),
    );
    gh.lazySingleton<_i902.CategoryRemoteDataSource>(
      () => _i902.CategoryRemoteDataSourceImpl(gh<_i393.DioClient>()),
    );
    gh.lazySingleton<_i874.FruitRepository>(
      () => _i618.FruitRepositoryImpl(gh<_i392.FruitRemoteDataSource>()),
    );
    gh.lazySingleton<_i236.CategoryRepository>(
      () => _i106.CategoryRepositoryImpl(gh<_i902.CategoryRemoteDataSource>()),
    );
    gh.lazySingleton<_i376.RecipeRepository>(
      () => _i816.RecipeRepositoryImpl(gh<_i56.RecipeRemoteDataSource>()),
    );
    gh.lazySingleton<_i689.FilterByCategoryUseCase>(
      () => _i689.FilterByCategoryUseCase(gh<_i376.RecipeRepository>()),
    );
    gh.lazySingleton<_i953.SearchRecipesUseCase>(
      () => _i953.SearchRecipesUseCase(gh<_i376.RecipeRepository>()),
    );
    gh.factory<_i264.RecipeListBloc>(
      () => _i264.RecipeListBloc(
        gh<_i689.FilterByCategoryUseCase>(),
        gh<_i953.SearchRecipesUseCase>(),
      ),
    );
    gh.lazySingleton<_i698.GetAllFruitsUseCase>(
      () => _i698.GetAllFruitsUseCase(gh<_i874.FruitRepository>()),
    );
    gh.lazySingleton<_i807.GetCategoriesUseCase>(
      () => _i807.GetCategoriesUseCase(gh<_i236.CategoryRepository>()),
    );
    gh.factory<_i143.NutritionTrackerCubit>(
      () => _i143.NutritionTrackerCubit(gh<_i698.GetAllFruitsUseCase>()),
    );
    gh.factory<_i479.CategoryBloc>(
      () => _i479.CategoryBloc(gh<_i807.GetCategoriesUseCase>()),
    );
    return this;
  }
}
