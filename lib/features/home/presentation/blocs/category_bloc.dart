import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/core/usecase/usecase.dart';
import 'package:ocean_friends_app/features/home/domain/use_cases/get_categories_usecase.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/category_event.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/category_state.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this._getCategoriesUseCase)
    : super(const CategoryState.initial()) {
    on<FetchCategories>(_onFetchCategories);
  }

  final GetCategoriesUseCase _getCategoriesUseCase;

  Future<void> _onFetchCategories(
    FetchCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(const CategoryState.loading());
    final result = await _getCategoriesUseCase(NoParams());
    result.fold(
      (failure) => emit(CategoryState.error(failure)),
      (categories) => emit(CategoryState.loaded(categories)),
    );
  }
}
