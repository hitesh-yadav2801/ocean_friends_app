import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ocean_friends_app/core/presentation/widgets/animated_shimmer.dart';
import 'package:ocean_friends_app/core/presentation/widgets/category_chip.dart';
import 'package:ocean_friends_app/core/presentation/widgets/recipe_card.dart';
import 'package:ocean_friends_app/core/theme/app_colors.dart';
import 'package:ocean_friends_app/core/theme/app_text_styles.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/category_bloc.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/category_event.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/category_state.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/user_bloc.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/user_event.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/user_state.dart';
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
  late final String _randomSubtitle;

  static const _subtitles = [
    'What are you having today?',
    'Discover your next favorite meal',
    'Time to cook something delicious!',
    'Let\'s find the perfect recipe for you',
    'Ready to try something new and tasty?',
    'Hungry for adventure? Pick a dish!',
  ];

  @override
  void initState() {
    super.initState();
    _randomSubtitle = (List<String>.from(_subtitles)..shuffle()).first;
    context.read<CategoryBloc>().add(const FetchCategories());
    context.read<UserBloc>().add(FetchUserProfile());
  }

  void _onCategorySelected(String categoryId, String categoryName) {
    if (_selectedCategoryId == categoryId) return;

    setState(() {
      _selectedCategoryId = categoryId;
    });
    if (categoryId == 'all') {
      context.read<RecipeListBloc>().add(const FetchAllRecipes());
    } else {
      context.read<RecipeListBloc>().add(FetchRecipesByCategory(categoryName));
    }
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
              SizedBox(height: 30.h),
              _buildSearchBar(context),
              SizedBox(height: 26.h),
              _buildCategories(),
              SizedBox(height: 24.h),
              _buildRecipes(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        var name = 'Jay';
        String? avatarUrl;

        if (state is UserLoaded) {
          name = state.name;
          avatarUrl = state.avatarUrl;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state is UserLoading)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.h),
                      child: AnimatedShimmer(
                        width: 120.w,
                        height: 24.h,
                        borderRadius: 4.r,
                      ),
                    )
                  else
                    Text(
                      'Hello $name',
                      style: AppTextStyles.headlineLarge.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  SizedBox(height: 6.h),
                  Text(
                    _randomSubtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontSize: 11.sp,
                      color: AppColors.gray3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                color: AppColors.secondary40,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: avatarUrl != null
                    ? Image.network(
                        avatarUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            SvgPicture.asset(
                              'assets/icons/avatar.svg',
                              fit: BoxFit.cover,
                            ),
                      )
                    : SvgPicture.asset(
                        'assets/icons/avatar.svg',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/search');
      },
      child: Container(
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.gray4,
            width: 1.3,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/search.svg',
              colorFilter: const ColorFilter.mode(
                AppColors.gray4,
                BlendMode.srcIn,
              ),
              width: 18.sp,
            ),
            SizedBox(width: 12.w),
            Text(
              'Search',
              style: AppTextStyles.labelSmall.copyWith(
                fontSize: 11.sp,
                color: AppColors.gray4,
              ),
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
              _onCategorySelected('all', 'All');
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
              separatorBuilder: (context, index) => SizedBox(width: 8.w),
              itemBuilder: (context, index) => AnimatedShimmer(
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
                itemCount: categories.length + 1,
                clipBehavior: Clip.none,
                separatorBuilder: (context, index) => SizedBox(width: 12.w),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    final isSelected = _selectedCategoryId == 'all';
                    return CategoryChip(
                      label: 'All',
                      isSelected: isSelected,
                      onTap: () => _onCategorySelected('all', 'All'),
                    );
                  }
                  final category = categories[index - 1];
                  final isSelected = _selectedCategoryId == category.idCategory;
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
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: 4,
            itemBuilder: (context, index) => AnimatedShimmer(
              height: 150.h,
              width: 150.w,
              borderRadius: 10.r,
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
