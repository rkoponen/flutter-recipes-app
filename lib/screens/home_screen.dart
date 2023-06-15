import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/providers/recipe_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/widgets/recipe_card_widget.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipeProvider);
    Recipe? featuredRecipe;
    if (recipes.isNotEmpty) {
      featuredRecipe = ref.watch(recipeProvider.notifier).getRandomRecipe();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorLight,
          title: const Text("Recipes"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => print("Search pressed."),
            )
          ],
        ),
        body: Center(
            child: Column(
          children: [
            const SizedBox(height: 16),
            Text("Today's featured recipe",
                style: GoogleFonts.quicksand(
                  textStyle: const TextStyle(fontSize: 24),
                )),
            const SizedBox(
              height: 16,
            ),
            if (featuredRecipe != null)
              RecipeCardWidget(recipe: featuredRecipe),
          ],
        )));
  }
}
