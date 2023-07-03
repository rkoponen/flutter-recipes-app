import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/screens/category_screen.dart';
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
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: HomeScreen());
            }),
        GoRoute(
          path: '/recipe/:recipeId',
          builder: (context, state) => RecipeScreen(
              recipeId: state.pathParameters['recipeId']!, backButton: true),
        ),
        GoRoute(
          path: "/recipe/random/:recipeId",
          pageBuilder: (context, state) => NoTransitionPage(
              child: RecipeScreen(
            recipeId: state.pathParameters['recipeId']!,
            backButton: false,
          )),
        ),
        GoRoute(
          path: '/category',
          pageBuilder: (context, state) => const NoTransitionPage(
              child: CategoryScreen(
            backButton: false,
          )),
        ),
        GoRoute(
            path: '/categories',
            builder: (context, state) =>
                const CategoryScreen(backButton: true)),
        GoRoute(
          path: '/category/:categoryName',
          builder: (context, state) => RecipeListScreen(
              categoryName: state.pathParameters['categoryName']!),
        ),
      ])
]);