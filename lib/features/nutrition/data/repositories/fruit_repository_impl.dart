import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/features/nutrition/data/datasources/fruit_remote_datasource.dart';
import 'package:ocean_friends_app/features/nutrition/domain/entities/fruit.dart';
import 'package:ocean_friends_app/features/nutrition/domain/repositories/fruit_repository.dart';

@LazySingleton(as: FruitRepository)
class FruitRepositoryImpl implements FruitRepository {
  FruitRepositoryImpl(this._remoteDataSource);

  final FruitRemoteDataSource _remoteDataSource;

  @override
  Future<AppResult<List<Fruit>>> getAllFruits() async {
    try {
      final models = await _remoteDataSource.getAllFruits();
      if (models.isEmpty) {
        return const Left(EmptyResultFailure(message: 'No fruits found.'));
      }

      return Right(models.map((model) => model.toEntity()).toList());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        return const Left(NetworkFailure());
      }

      return Left(
        ServerFailure(
          message: e.message ?? 'Failed to load fruits.',
          statusCode: e.response?.statusCode,
        ),
      );
    } on Exception catch (e) {
      return Left(ParseFailure(message: e.toString()));
    }
  }
}
