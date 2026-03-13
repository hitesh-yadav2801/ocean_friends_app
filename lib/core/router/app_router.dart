import 'package:go_router/go_router.dart';
import 'package:ocean_friends_app/core/router/route_names.dart';
import 'package:ocean_friends_app/features/home/presentation/pages/main_bottom_navigation_page.dart';
import 'package:ocean_friends_app/features/nutrition/presentation/pages/cart_page.dart';
import 'package:ocean_friends_app/features/nutrition/presentation/pages/daily_nutrition_requirements_page.dart';
import 'package:ocean_friends_app/features/search/presentation/pages/search_page.dart';
import 'package:ocean_friends_app/features/splash/presentation/pages/splash_screen.dart';

/// Central router configuration using [GoRouter].
///
/// Configuration for application routing.
final appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteNames.home,
      name: RouteNames.homeName,
      builder: (context, state) => const MainBottomNavigationPage(),
    ),
    GoRoute(
      path: RouteNames.dailyNutrition,
      name: RouteNames.dailyNutritionName,
      builder: (context, state) => const DailyNutritionRequirementsPage(),
    ),
    GoRoute(
      path: RouteNames.cart,
      name: RouteNames.cartName,
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: RouteNames.search,
      name: RouteNames.searchName,
      builder: (context, state) => const SearchPage(),
    ),
  ],
);
