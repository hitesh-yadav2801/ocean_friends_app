import 'package:equatable/equatable.dart';

sealed class RecipeListEvent extends Equatable {
  const RecipeListEvent();

  @override
  List<Object?> get props => [];
}

class FetchRecipesByCategory extends RecipeListEvent {
  const FetchRecipesByCategory(this.category);

  final String category;

  @override
  List<Object?> get props => [category];
}

class FetchAllRecipes extends RecipeListEvent {
  const FetchAllRecipes();
}

class SearchRecipes extends RecipeListEvent {
  const SearchRecipes(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}
