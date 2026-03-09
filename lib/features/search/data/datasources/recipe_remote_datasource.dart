import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/core/network/dio_client.dart';
import 'package:ocean_friends_app/features/search/data/models/recipe_response_model.dart';

/// Interface for the Recipe Remote Data Source.
abstract class RecipeRemoteDataSource {
  Future<RecipeResponseModel> searchRecipes(String query);
  Future<RecipeResponseModel> filterByCategory(String category);
}

/// Implementation of [RecipeRemoteDataSource] using [Dio].
@LazySingleton(as: RecipeRemoteDataSource)
class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  RecipeRemoteDataSourceImpl(this.dioClient);

  final DioClient dioClient;

  @override
  Future<RecipeResponseModel> searchRecipes(String query) async {
    final response = await dioClient.dio.get<Map<String, dynamic>>(
      '/search.php',
      queryParameters: {'s': query},
    );
    return RecipeResponseModel.fromJson(response.data!);
  }

  @override
  Future<RecipeResponseModel> filterByCategory(String category) async {
    final response = await dioClient.dio.get<Map<String, dynamic>>(
      '/filter.php',
      queryParameters: {'c': category},
    );
    return RecipeResponseModel.fromJson(response.data!);
  }
}
