import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/providers/recipe_provider.dart';
import 'package:recipes_app/widgets/recipe_card_widget.dart';

import '../models/recipe.dart';

class RecipeListWidget extends ConsumerWidget {
  final String categoryName;

  const RecipeListWidget({required this.categoryName, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes =
        ref.watch(recipeProvider.notifier).findRecipesByCategory(categoryName);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return Column(
            children: [RecipeCardWidget(recipe: recipe), SizedBox(height: 16)]);
      },
    );
  }
}
