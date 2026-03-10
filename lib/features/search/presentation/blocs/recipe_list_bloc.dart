import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:ocean_friends_app/features/search/domain/use_cases/filter_by_category_usecase.dart';
import 'package:ocean_friends_app/features/search/domain/use_cases/search_recipes_usecase.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_event.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_state.dart';

@injectable
class RecipeListBloc extends Bloc<RecipeListEvent, RecipeListState> {
  RecipeListBloc(
    this._filterByCategoryUseCase,
    this._searchRecipesUseCase,
  ) : super(const RecipeListState.initial()) {
    on<FetchRecipesByCategory>(_onFetchRecipesByCategory);
    on<FetchAllRecipes>(_onFetchAllRecipes);
    on<SearchRecipes>(_onSearchRecipes);
  }

  final FilterByCategoryUseCase _filterByCategoryUseCase;
  final SearchRecipesUseCase _searchRecipesUseCase;

  Future<void> _onFetchRecipesByCategory(
    FetchRecipesByCategory event,
    Emitter<RecipeListState> emit,
  ) async {
    emit(const RecipeListState.loading());
    final result = await _filterByCategoryUseCase(
      FilterByCategoryParams(event.category),
    );
    result.fold(
      (failure) => emit(RecipeListState.error(failure)),
      (recipes) => emit(RecipeListState.loaded(recipes)),
    );
  }

  Future<void> _onFetchAllRecipes(
    FetchAllRecipes event,
    Emitter<RecipeListState> emit,
  ) async {
    emit(const RecipeListState.loading());
    final result = await _searchRecipesUseCase(
      const SearchRecipesParams(''),
    );
    result.fold(
      (failure) => emit(RecipeListState.error(failure)),
      (recipes) => emit(RecipeListState.loaded(recipes)),
    );
  }

  Future<void> _onSearchRecipes(
    SearchRecipes event,
    Emitter<RecipeListState> emit,
  ) async {
    // Treat empty as initial or fetch defaults
    if (event.query.trim().isEmpty) {
      emit(const RecipeListState.initial());
      return;
    }

    emit(const RecipeListState.loading());
    final result = await _searchRecipesUseCase(
      SearchRecipesParams(event.query),
    );
    result.fold(
      (failure) => emit(RecipeListState.error(failure)),
      (recipes) => emit(RecipeListState.loaded(recipes)),
    );
  }
}
