import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/ingredient_list_widget.dart';
import 'package:recipes_app/widgets/steps_list_widget.dart';

import '../models/ingredient.dart';
import '../models/recipe.dart';

class BigRecipeCardWidget extends StatelessWidget {
  final Recipe featuredRecipe;

  BigRecipeCardWidget({required this.featuredRecipe});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
        child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Card(
                child: ListView(children: [
              Column(
                children: [
                  Text(featuredRecipe.name),
                  Text(featuredRecipe.description),
                  SizedBox(height: 300, width: 400, child: Placeholder()),
                  IngredientListWidget(ingredients: featuredRecipe.ingredients),
                  StepsListWidget(steps: featuredRecipe.steps)
                ],
              )
            ]))));
  }
}
