import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/breakpoints.dart';
import 'package:recipes_app/providers/recipe_provider.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/widgets/big_recipe_card_widget.dart';
import 'package:recipes_app/widgets/category_list_widget.dart';
import 'package:recipes_app/widgets/recipe_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    if (width < Breakpoints.lg) {
      return const MobileLayout();
    } else {
      return const DesktopLayout();
    }
  }
}

class MobileLayout extends ConsumerWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipeProvider);
    Recipe? featuredRecipe;
    if (recipes.isNotEmpty) {
      featuredRecipe = ref.watch(recipeProvider.notifier).getRandomRecipe();
    }
    return Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const SizedBox(height: 16),
              Text("Today's featured recipe",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 16,
              ),
              if (featuredRecipe != null)
                RecipeCardWidget(recipe: featuredRecipe),
              const SizedBox(height: 16),
              Text("Recipe categories",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: const CategoryListWidget(
                  subset: true,
                  mobileLayout: true,
                  categoryScreen: false,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text("View more categories"),
                onPressed: () => context.push("/categories"),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          )),
        ));
  }
}

class DesktopLayout extends ConsumerWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipeProvider);
    Recipe? featuredRecipe;
    if (recipes.isNotEmpty) {
      featuredRecipe = ref.watch(recipeProvider.notifier).getRandomRecipe();
    }
    return Container(
        color: Colors.white,
        child: Row(children: [
          if (featuredRecipe != null)
            BigRecipeCardWidget(featuredRecipe: featuredRecipe),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    Text("Recipe categories",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 10),
                    const CategoryListWidget(
                        subset: true,
                        mobileLayout: true,
                        categoryScreen: false),
                    ElevatedButton(
                      child: const Text("View more categories"),
                      onPressed: () => context.push("/categories"),
                    ),
                  ]))),
        ]));
  }
}
