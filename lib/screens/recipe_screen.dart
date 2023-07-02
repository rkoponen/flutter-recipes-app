import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/providers/recipe_provider.dart';
import 'package:recipes_app/widgets/ingredient_list_widget.dart';
import 'package:recipes_app/widgets/steps_list_widget.dart';

class RecipeScreen extends ConsumerWidget {
  String recipeId;
  final bool backButton;

  RecipeScreen({super.key, required this.recipeId, required this.backButton});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipe = ref.watch(recipeProvider.notifier).findRecipeById(recipeId);
    //categoriesStr += recipe.categories.last;
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (backButton) const BackButton(),
              SizedBox(width: 16),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Categories: ${recipe.categories.join(", ")}",
                    style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300),
                  )),
            ],
          ),
          const SizedBox(height: 16),
          const Placeholder(
            fallbackHeight: 200,
            fallbackWidth: 200,
          ),
          ListTile(
            title: Text(recipe.name,
                style: Theme.of(context).textTheme.headlineLarge),
            subtitle: Text(recipe.description,
                style: Theme.of(context).textTheme.titleMedium),
            trailing: const Icon(Icons.favorite_border_rounded, size: 30.0),
          ),
          const Divider(),
          Text("Ingredients",
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.left),
          IngredientListWidget(ingredients: recipe.ingredients),
          const Divider(),
          Text("Steps", style: Theme.of(context).textTheme.headlineSmall),
          StepsListWidget(steps: recipe.steps)
        ],
      ),
    ));
  }
}
