import 'dart:js';

import 'package:go_router/go_router.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/recipe_list_screen.dart';
import 'package:recipes_app/screens/recipe_screen.dart';
import 'package:recipes_app/widgets/scaffold_with_bottom_nav.dart';

final router = GoRouter(initialLocation: '/', routes: [
  ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithBottomNav(child: child);
      },
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) {
              return const HomeScreen();
            }),
        GoRoute(
          path: '/recipe/:recipeId',
          builder: (context, state) =>
              RecipeScreen(recipeId: state.pathParameters['recipeId']!),
        ),
        GoRoute(
          path: '/category/:categoryName',
          builder: (context, state) => RecipeListScreen(
              categoryName: state.pathParameters['categoryName']!),
        )
      ])
]);
