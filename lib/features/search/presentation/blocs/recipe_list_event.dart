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

/// Triggered by the voice search feature after speech is recognised.
///
/// The [SmartQueryParser] decides whether to dispatch a category filter
/// or keyword search based on the recognised text.
class VoiceSearchRecipes extends RecipeListEvent {
  const VoiceSearchRecipes({
    required this.recognisedText,
    required this.knownCategories,
  });

  /// Raw text from speech recognition.
  final String recognisedText;

  /// Category names currently loaded from the API, used for smart matching.
  final List<String> knownCategories;

  @override
  List<Object?> get props => [recognisedText, knownCategories];
}
