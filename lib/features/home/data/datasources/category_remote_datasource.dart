import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/core/network/dio_client.dart';
import 'package:ocean_friends_app/features/home/data/models/category_response_model.dart';

/// Interface for the Category Remote Data Source.
abstract class CategoryRemoteDataSource {
  Future<CategoryResponseModel> getCategories();
}

/// Implementation of [CategoryRemoteDataSource] using [Dio].
@LazySingleton(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  CategoryRemoteDataSourceImpl(this.dioClient);

  final DioClient dioClient;

  @override
  Future<CategoryResponseModel> getCategories() async {
    final response =
        await dioClient.dio.get<Map<String, dynamic>>('/categories.php');
    return CategoryResponseModel.fromJson(response.data!);
  }
}
