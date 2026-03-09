import 'package:go_router/go_router.dart';
import 'package:ocean_friends_app/core/router/route_names.dart';
import 'package:ocean_friends_app/features/home/presentation/pages/home_page.dart';
import 'package:ocean_friends_app/features/search/presentation/pages/search_page.dart';

/// Central router configuration using [GoRouter].
///
/// Configuration for application routing.
final appRouter = GoRouter(
  initialLocation: RouteNames.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouteNames.home,
      name: RouteNames.homeName,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: RouteNames.search,
      name: RouteNames.searchName,
      builder: (context, state) => const SearchPage(),
    ),
  ],
);
