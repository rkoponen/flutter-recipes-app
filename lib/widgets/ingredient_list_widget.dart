import 'package:flutter/material.dart';

import '../models/ingredient.dart';

class IngredientListWidget extends StatelessWidget {
  final List<Ingredient> ingredients;
  const IngredientListWidget({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                final ingredient = ingredients[index];
                return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                        "\u2022 ${ingredient.name}: ${ingredient.amount}",
                        style: Theme.of(context).textTheme.bodyLarge));
              },
            )));
  }
}
