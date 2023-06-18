import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/providers/recipe_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/widgets/bottom_nav_bar.dart';
import 'package:recipes_app/widgets/category_list_widget.dart';
import 'package:recipes_app/widgets/recipe_card_widget.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipeProvider);
    Recipe? featuredRecipe;
    if (recipes.isNotEmpty) {
      featuredRecipe = ref.watch(recipeProvider.notifier).getRandomRecipe();
    }
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          const SizedBox(height: 16),
          Text("Today's featured recipe",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 16,
          ),
          if (featuredRecipe != null) RecipeCardWidget(recipe: featuredRecipe),
          const SizedBox(height: 16),
          Text("Recipe categories",
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            child: CategoryListWidget(subset: true),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            child: Text("View more categories"),
            onPressed: () => print("category button pressed"),
          ),
          SizedBox(
            height: 16,
          )
        ],
      )),
    );
  }
}
