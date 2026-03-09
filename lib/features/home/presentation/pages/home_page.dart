import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ocean_friends_app/core/presentation/widgets/animated_shimmer.dart';
import 'package:ocean_friends_app/core/presentation/widgets/category_chip.dart';
import 'package:ocean_friends_app/core/presentation/widgets/recipe_card.dart';
import 'package:ocean_friends_app/core/theme/app_colors.dart';
import 'package:ocean_friends_app/core/theme/app_text_styles.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/category_bloc.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/category_event.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/category_state.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_bloc.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_event.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(const FetchCategories());
  }

  void _onCategorySelected(String categoryId, String categoryName) {
    if (_selectedCategoryId == categoryId) return;

    setState(() {
      _selectedCategoryId = categoryId;
    });
    context.read<RecipeListBloc>().add(FetchRecipesByCategory(categoryName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              SizedBox(height: 20.h),
              _buildSearchBar(context),
              SizedBox(height: 24.h),
              _buildCategories(),
              SizedBox(height: 16.h),
              _buildRecipes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Jay',
              style: AppTextStyles.headlineLarge,
            ),
            SizedBox(height: 6.h),
            Text(
              'What are you having today?',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.gray3,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 24.r,
          backgroundColor: AppColors.primaryLight,
          backgroundImage: const NetworkImage(
            'https://i.pravatar.cc/150?img=68',
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/search');
      },
      child: Container(
        height: 52.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: AppColors.gray4, size: 20.sp),
            SizedBox(width: 12.w),
            Text(
              'Search recipes...',
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (categories) {
            if (categories.isNotEmpty && _selectedCategoryId == null) {
              _onCategorySelected(
                categories.first.idCategory,
                categories.first.strCategory,
              );
            }
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => SizedBox(
            height: 40.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (_, _) => SizedBox(width: 8.w),
              itemBuilder: (_, _) => AnimatedShimmer(
                width: 100.w,
                height: 40.h,
                borderRadius: 20.r,
              ),
            ),
          ),
          loaded: (categories) {
            return SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                clipBehavior: Clip.none,
                separatorBuilder: (_, _) => SizedBox(width: 12.w),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  // If no selection yet, treat first as selected in UI (already firing event)
                  final isSelected =
                      _selectedCategoryId == category.idCategory ||
                      (_selectedCategoryId == null && index == 0);
                  return CategoryChip(
                    label: category.strCategory,
                    isSelected: isSelected,
                    onTap: () => _onCategorySelected(
                      category.idCategory,
                      category.strCategory,
                    ),
                  );
                },
              ),
            );
          },
          error: (failure) => Text(
            'Failed to load categories',
            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.error),
          ),
        );
      },
    );
  }

  Widget _buildRecipes() {
    return BlocBuilder<RecipeListBloc, RecipeListState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: 4,
            itemBuilder: (_, _) => AnimatedShimmer(
              height: 200.h,
              borderRadius: 16.r,
            ),
          ),
          loaded: (recipes) {
            if (recipes.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: Text(
                    'No recipes found.',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.gray3,
                    ),
                  ),
                ),
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
              ),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return RecipeCard(
                  recipe: recipe,
                  onTap: () {
                    // Navigate to recipe detail (if exists)
                  },
                );
              },
            );
          },
          error: (failure) => Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Text(
                'Failed to load recipes',
                style: AppTextStyles.bodyLarge.copyWith(color: AppColors.error),
              ),
            ),
          ),
        );
      },
    );
  }
}
