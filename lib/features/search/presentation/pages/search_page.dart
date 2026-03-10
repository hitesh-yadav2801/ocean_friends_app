import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ocean_friends_app/core/presentation/widgets/animated_shimmer.dart';
import 'package:ocean_friends_app/core/presentation/widgets/recipe_card.dart';
import 'package:ocean_friends_app/core/theme/app_colors.dart';
import 'package:ocean_friends_app/core/theme/app_text_styles.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/category_bloc.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/category_state.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_bloc.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_event.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_state.dart';
import 'package:ocean_friends_app/features/search/presentation/cubits/voice_search_cubit.dart';
import 'package:ocean_friends_app/features/search/presentation/cubits/voice_search_state.dart';

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
    final trimmedQuery = query.trim();
    setState(() {
      _currentQuery = trimmedQuery;
    });
    context.read<RecipeListBloc>().add(SearchRecipes(trimmedQuery));
  }

  /// Dispatches a voice search event using smart query parsing.
  void _onVoiceSearchCompleted(String recognisedText) {
    _searchController.text = recognisedText;
    setState(() {
      _currentQuery = recognisedText;
    });

    // Gather known categories from the CategoryBloc for smart matching.
    final categoryState = context.read<CategoryBloc>().state;
    final knownCategories = categoryState.maybeWhen(
      loaded: (categories) => categories.map((c) => c.strCategory).toList(),
      orElse: () => <String>[],
    );

    context.read<RecipeListBloc>().add(
      VoiceSearchRecipes(
        recognisedText: recognisedText,
        knownCategories: knownCategories,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VoiceSearchCubit, VoiceSearchState>(
      listener: (context, voiceState) {
        switch (voiceState) {
          case VoiceSearchDone(:final recognisedText):
            _onVoiceSearchCompleted(recognisedText);
            context.read<VoiceSearchCubit>().reset();
          case VoiceSearchError(:final message):
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(message),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            context.read<VoiceSearchCubit>().reset();
          case _:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Search recipes',
            style: AppTextStyles.titleMedium.copyWith(fontSize: 18.sp),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                _buildSearchBar(),
                SizedBox(height: 8.h),
                _buildVoiceListeningIndicator(),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search Result',
                      style: AppTextStyles.titleLarge.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    BlocBuilder<RecipeListBloc, RecipeListState>(
                      builder: (context, state) {
                        if (_currentQuery.isEmpty)
                          return const SizedBox.shrink();
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
        // end Scaffold body
      ),
      // end BlocListener child
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48.h,
            child: TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: _onSearchRefreshed,
              style: AppTextStyles.labelSmall.copyWith(
                fontSize: 11.sp,
                color: AppColors.labelColor,
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: AppTextStyles.labelSmall.copyWith(
                  fontSize: 11.sp,
                  color: AppColors.gray4,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(14.r),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.gray4,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    color: AppColors.gray4,
                    width: 1.3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.3,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        _buildMicButton(),
      ],
    );
  }

  Widget _buildMicButton() {
    return BlocBuilder<VoiceSearchCubit, VoiceSearchState>(
      builder: (context, voiceState) {
        final isListening = voiceState is VoiceSearchListening;

        return GestureDetector(
          onTap: () {
            if (isListening) {
              context.read<VoiceSearchCubit>().stopListening();
            } else {
              context.read<VoiceSearchCubit>().startListening();
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 48.r,
            height: 48.r,
            decoration: BoxDecoration(
              color: isListening ? AppColors.primary : Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: isListening ? AppColors.primary : AppColors.gray4,
                width: 1.3,
              ),
            ),
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: isListening ? Colors.white : AppColors.gray4,
              size: 22.sp,
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceListeningIndicator() {
    return BlocBuilder<VoiceSearchCubit, VoiceSearchState>(
      builder: (context, voiceState) {
        return switch (voiceState) {
          VoiceSearchListening(:final partialText) => Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.primaryLight.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                _PulsingDot(),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    partialText.isEmpty ? 'Listening...' : partialText,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.primary,
                      fontStyle: partialText.isEmpty
                          ? FontStyle.italic
                          : FontStyle.normal,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () => context.read<VoiceSearchCubit>().stopListening(),
                  child: Icon(
                    Icons.close,
                    size: 18.sp,
                    color: AppColors.gray3,
                  ),
                ),
              ],
            ),
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget _buildSearchResults() {
    if (_currentQuery.isEmpty) {
      return _buildInitialState();
    }

    return BlocBuilder<RecipeListBloc, RecipeListState>(
      builder: (context, state) {
        return state.when(
          initial: _buildInitialState,
          loading: () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: 6,
            itemBuilder: (context, index) => AnimatedShimmer(
              height: 150.h,
              width: 150.w,
              borderRadius: 10.r,
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

  Widget _buildInitialState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 48.sp, color: AppColors.gray4),
          SizedBox(height: 12.h),
          Text(
            'Type or tap the mic to search',
            style: AppTextStyles.bodyLarge.copyWith(color: AppColors.gray3),
          ),
        ],
      ),
    );
  }
}

/// A small dot that pulses with an opacity animation to indicate active listening.
class _PulsingDot extends StatefulWidget {
  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.3, end: 1).animate(_controller),
      child: Container(
        width: 10.r,
        height: 10.r,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
