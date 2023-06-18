import 'package:flutter/material.dart';

import '../models/ingredient.dart';

class IngredientListWidget extends StatelessWidget {
  final List<Ingredient> ingredients;
  IngredientListWidget({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ingredients.length,
      itemBuilder: (BuildContext context, int index) {
        final ingredient = ingredients[index];
        return Padding(
            padding: EdgeInsets.all(5.0),
            child: Text("\u2022 ${ingredient.name}: ${ingredient.amount}",
                style: Theme.of(context).textTheme.bodyLarge));
      },
    );
  }
}
