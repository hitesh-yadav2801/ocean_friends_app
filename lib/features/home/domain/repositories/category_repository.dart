import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/features/home/domain/entities/category.dart';

/// Interface for the Category Repository.
abstract class CategoryRepository {
  /// Fetches the list of all meal categories.
  Future<AppResult<List<Category>>> getCategories();
}
