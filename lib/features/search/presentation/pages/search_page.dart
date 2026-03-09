import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ocean_friends_app/core/presentation/widgets/animated_shimmer.dart';
import 'package:ocean_friends_app/core/presentation/widgets/recipe_card.dart';
import 'package:ocean_friends_app/core/theme/app_colors.dart';
import 'package:ocean_friends_app/core/theme/app_text_styles.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_bloc.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_event.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _currentQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchRefreshed(String query) {
    if (query.trim().isEmpty) return;
    setState(() {
      _currentQuery = query;
    });
    context.read<RecipeListBloc>().add(SearchRecipes(query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => context.pop(),
              ),
              SizedBox(height: 16.h),
              Text(
                'Search recipes',
                style: AppTextStyles.headlineLarge,
              ),
              SizedBox(height: 12.h),
              _buildSearchBar(),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search Result',
                    style: AppTextStyles.titleLarge,
                  ),
                  BlocBuilder<RecipeListBloc, RecipeListState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (recipes) => Text(
                          '${recipes.length} results',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.gray3,
                          ),
                        ),
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: _buildSearchResults(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      textInputAction: TextInputAction.search,
      onSubmitted: _onSearchRefreshed,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Icon(Icons.search, color: AppColors.gray4, size: 20.sp),
      ),
    );
  }

  Widget _buildSearchResults() {
    return BlocBuilder<RecipeListBloc, RecipeListState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(
            child: Text(
              'Type to search for recipes',
              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.gray3),
            ),
          ),
          loading: () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: 6,
            itemBuilder: (_, _) => AnimatedShimmer(
              height: 200.h,
              borderRadius: 16.r,
            ),
          ),
          loaded: (recipes) {
            if (recipes.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_off, size: 64.sp, color: AppColors.gray4),
                    SizedBox(height: 16.h),
                    Text(
                      'No recipes found for "$_currentQuery"',
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: AppColors.gray3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                  recipe: recipes[index],
                  onTap: () {
                    // Navigate to recipe details
                  },
                );
              },
            );
          },
          error: (failure) => Center(
            child: Text(
              'Failed to load search results.',
              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.error),
            ),
          ),
        );
      },
    );
  }
}
