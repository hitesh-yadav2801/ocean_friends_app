import 'package:go_router/go_router.dart';
import 'package:ocean_friends_app/core/router/route_names.dart';
import 'package:ocean_friends_app/features/recipes/presentation/pages/recipes_page.dart';

/// Central router configuration using [GoRouter].
///
/// All route definitions live here. Use [RouteNames] constants for named
/// navigation — never pass raw strings when pushing routes.
final appRouter = GoRouter(
  initialLocation: RouteNames.recipes,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouteNames.recipes,
      name: RouteNames.recipesName,
      builder: (context, state) => const RecipesPage(),
    ),
    // Additional routes (e.g. recipe detail) will be added in Phase 5.
  ],
);
