import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/features/search/data/datasources/recipe_remote_datasource.dart';
import 'package:ocean_friends_app/features/search/domain/entities/recipe.dart';
import 'package:ocean_friends_app/features/search/domain/repositories/recipe_repository.dart';

/// Implementation of [RecipeRepository] that coordinates data from the remote data source.
@LazySingleton(as: RecipeRepository)
class RecipeRepositoryImpl implements RecipeRepository {
  RecipeRepositoryImpl(this.remoteDataSource);

  final RecipeRemoteDataSource remoteDataSource;

  @override
  Future<AppResult<List<Recipe>>> searchRecipes(String query) async {
    try {
      final response = await remoteDataSource.searchRecipes(query);
      if (response.meals == null || response.meals!.isEmpty) {
        return const Left(
          EmptyResultFailure(message: 'No recipes found for this search.'),
        );
      }
      return Right(response.meals!.map((model) => model.toEntity()).toList());
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (e) {
      return Left(ParseFailure(message: e.toString()));
    }
  }

  @override
  Future<AppResult<List<Recipe>>> filterByCategory(String category) async {
    try {
      final response = await remoteDataSource.filterByCategory(category);
      if (response.meals == null || response.meals!.isEmpty) {
        return const Left(
          EmptyResultFailure(message: 'No recipes found for this category.'),
        );
      }
      return Right(response.meals!.map((model) => model.toEntity()).toList());
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } on Exception catch (e) {
      return Left(ParseFailure(message: e.toString()));
    }
  }

  Failure _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const NetworkFailure();
    }
    return ServerFailure(
      message: e.message ?? 'Unknown server error',
      statusCode: e.response?.statusCode,
    );
  }
}
