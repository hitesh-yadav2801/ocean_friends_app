// The datasource contract intentionally exposes a single method.
// ignore_for_file: one_member_abstracts

import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/core/constants/api_constants.dart';
import 'package:ocean_friends_app/core/network/dio_client.dart';
import 'package:ocean_friends_app/features/nutrition/data/models/fruit_model.dart';

abstract class FruitRemoteDataSource {
  Future<List<FruitModel>> getAllFruits();
}

@LazySingleton(as: FruitRemoteDataSource)
class FruitRemoteDataSourceImpl implements FruitRemoteDataSource {
  FruitRemoteDataSourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<List<FruitModel>> getAllFruits() async {
    final response = await _dioClient.dio.get<List<dynamic>>(
      ApiConstants.fruitAll,
    );

    final data = response.data ?? <dynamic>[];
    return data
        .map((json) => FruitModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
