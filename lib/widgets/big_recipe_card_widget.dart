import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/ingredient_list_widget.dart';
import 'package:recipes_app/widgets/steps_list_widget.dart';

import '../models/recipe.dart';

class BigRecipeCardWidget extends StatelessWidget {
  final Recipe featuredRecipe;

  const BigRecipeCardWidget({super.key, required this.featuredRecipe});

  @override
  Widget build(BuildContext context) {

    return Expanded(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
                child: ListView(children: [
              Column(
                children: [
                  const SizedBox(height: 5),
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Column(
                        children: [
                          Text("Featured recipe: ${featuredRecipe.name}",
                              style: Theme.of(context).textTheme.titleLarge),
                          Text(featuredRecipe.description,
                              style: const TextStyle(fontStyle: FontStyle.italic)),
                        ],
                      ))),
                  const SizedBox(height: 300, width: 400, child: Placeholder()),
                  const SizedBox(height: 10),
                  Text("Ingredients",
                      style: Theme.of(context).textTheme.titleMedium),
                  IngredientListWidget(ingredients: featuredRecipe.ingredients),
                  const SizedBox(height: 10),
                  Text("Steps", style: Theme.of(context).textTheme.titleMedium),
                  StepsListWidget(steps: featuredRecipe.steps)
                ],
              )
            ]))));
  }
}
