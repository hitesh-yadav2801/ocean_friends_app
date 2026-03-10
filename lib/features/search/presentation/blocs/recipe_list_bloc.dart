import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ocean_friends_app/core/errors/failures.dart';

import 'package:ocean_friends_app/features/search/domain/use_cases/filter_by_category_usecase.dart';
import 'package:ocean_friends_app/features/search/domain/use_cases/search_recipes_usecase.dart';
import 'package:ocean_friends_app/features/search/domain/utils/smart_query_parser.dart';
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
    on<VoiceSearchRecipes>(_onVoiceSearchRecipes);
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
      (failure) {
        if (failure is EmptyResultFailure) {
          emit(const RecipeListState.loaded([]));
        } else {
          emit(RecipeListState.error(failure));
        }
      },
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
      (failure) {
        if (failure is EmptyResultFailure) {
          emit(const RecipeListState.loaded([]));
        } else {
          emit(RecipeListState.error(failure));
        }
      },
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
      (failure) {
        if (failure is EmptyResultFailure) {
          emit(const RecipeListState.loaded([]));
        } else {
          emit(RecipeListState.error(failure));
        }
      },
      (recipes) => emit(RecipeListState.loaded(recipes)),
    );
  }

  /// Handles voice search by using [SmartQueryParser] to choose the strategy.
  Future<void> _onVoiceSearchRecipes(
    VoiceSearchRecipes event,
    Emitter<RecipeListState> emit,
  ) async {
    if (event.recognisedText.trim().isEmpty) {
      emit(const RecipeListState.initial());
      return;
    }

    emit(const RecipeListState.loading());

    final queryResult = SmartQueryParser.parse(
      event.recognisedText,
      event.knownCategories,
    );

    switch (queryResult) {
      case CategoryQuery(:final category):
        final result = await _filterByCategoryUseCase(
          FilterByCategoryParams(category),
        );
        result.fold(
          (failure) {
            if (failure is EmptyResultFailure) {
              emit(const RecipeListState.loaded([]));
            } else {
              emit(RecipeListState.error(failure));
            }
          },
          (recipes) => emit(RecipeListState.loaded(recipes)),
        );

      case KeywordQuery(:final keyword):
        final result = await _searchRecipesUseCase(
          SearchRecipesParams(keyword),
        );
        result.fold(
          (failure) {
            if (failure is EmptyResultFailure) {
              emit(const RecipeListState.loaded([]));
            } else {
              emit(RecipeListState.error(failure));
            }
          },
          (recipes) => emit(RecipeListState.loaded(recipes)),
        );
    }
  }
}
