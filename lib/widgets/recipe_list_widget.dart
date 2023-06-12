import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/providers/recipe_provider.dart';

class RecipeListWidget extends ConsumerWidget {
  const RecipeListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipeProvider);

    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return Card(child: ListTile(title: Text(recipe.name)));
      },
    );
  }
}
