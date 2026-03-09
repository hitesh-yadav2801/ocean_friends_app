import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/core/errors/failures.dart';
import 'package:ocean_friends_app/core/usecase/usecase.dart';
import 'package:ocean_friends_app/features/home/domain/entities/category.dart';
import 'package:ocean_friends_app/features/home/domain/repositories/category_repository.dart';

/// UseCase to fetch all meal categories.
@lazySingleton
class GetCategoriesUseCase implements UseCase<List<Category>, NoParams> {
  const GetCategoriesUseCase(this.repository);

  final CategoryRepository repository;

  @override
  Future<AppResult<List<Category>>> call(NoParams params) {
    return repository.getCategories();
  }
}
