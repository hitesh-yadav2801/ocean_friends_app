import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocean_friends_app/core/constants/app_constants.dart';
import 'package:ocean_friends_app/core/router/app_router.dart';
import 'package:ocean_friends_app/core/theme/app_theme.dart';
import 'package:ocean_friends_app/core/utils/app_logger.dart';
import 'package:ocean_friends_app/di/injection.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/user_bloc.dart';
import 'package:ocean_friends_app/features/home/presentation/blocs/category_bloc.dart';
import 'package:ocean_friends_app/features/search/presentation/blocs/recipe_list_bloc.dart';
import 'package:ocean_friends_app/features/search/presentation/cubits/voice_search_cubit.dart';

/// Application entry point.
///
/// Sequence:
/// 1. [WidgetsFlutterBinding.ensureInitialized] — required before any async work.
/// 2. [configureDependencies] — registers all GetIt bindings (network, repos, BLoCs).
/// 3. [runApp] — mounts the widget tree.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection.
  await configureDependencies();

  AppLogger.i('Dependencies configured — launching app.');

  runApp(const OceanFriendsApp());
}

/// Root widget of the application.
///
/// Wraps the entire widget tree with [ScreenUtilInit] so every `.sp`, `.w`,
/// `.h`, and `.r` sizing adapts proportionally to the current device.
class OceanFriendsApp extends StatelessWidget {
  const OceanFriendsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Design size configuration.
      designSize: const Size(
        AppConstants.designWidth,
        AppConstants.designHeight,
      ),
      minTextAdapt: true,
      // Builder is called once responsive context is ready.
      builder: (_, __) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CategoryBloc>(
              create: (_) => sl<CategoryBloc>(),
            ),
            BlocProvider<RecipeListBloc>(
              create: (_) => sl<RecipeListBloc>(),
            ),
            BlocProvider<UserBloc>(
              create: (_) => sl<UserBloc>(),
            ),
            BlocProvider<VoiceSearchCubit>(
              create: (_) => sl<VoiceSearchCubit>(),
            ),
          ],
          child: MaterialApp.router(
            title: 'Ocean Friends — Recipes',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            routerConfig: appRouter,
          ),
        );
      },
    );
  }
}
