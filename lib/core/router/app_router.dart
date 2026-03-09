import 'package:go_router/go_router.dart';
import 'package:ocean_friends_app/core/router/route_names.dart';
import 'package:ocean_friends_app/features/recipes/presentation/pages/recipes_page.dart';

/// Central router configuration using [GoRouter].
///
/// Configuration for application routing.
final appRouter = GoRouter(
  initialLocation: RouteNames.recipes,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouteNames.recipes,
      name: RouteNames.recipesName,
      builder: (context, state) => const RecipesPage(),
    ),

  ],
);
