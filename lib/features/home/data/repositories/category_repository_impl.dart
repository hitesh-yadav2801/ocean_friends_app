import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/features/home/data/datasources/category_remote_datasource.dart';
import 'package:ocean_friends_app/features/home/domain/entities/category.dart';
import 'package:ocean_friends_app/features/home/domain/repositories/category_repository.dart';

/// Implementation of [CategoryRepository] that coordinates data from the remote data source.
@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(this.remoteDataSource);

  final CategoryRemoteDataSource remoteDataSource;

  @override
  Future<AppResult<List<Category>>> getCategories() async {
    try {
      final response = await remoteDataSource.getCategories();
      if (response.categories.isEmpty) {
        return const Left(EmptyResultFailure());
      }
      return Right(
        response.categories.map((model) => model.toEntity()).toList(),
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return const Left(NetworkFailure());
      }
      return Left(
        ServerFailure(
          message: e.message ?? 'Unknown server error',
          statusCode: e.response?.statusCode,
        ),
      );
    } on Exception catch (e) {
      return Left(ParseFailure(message: e.toString()));
    }
  }
}
