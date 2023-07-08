import 'package:flutter/material.dart';

import '../models/ingredient.dart';

class IngredientListWidget extends StatelessWidget {
  final List<Ingredient> ingredients;
  const IngredientListWidget({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                final ingredient = ingredients[index];
                final dots = ingredient.amount.isEmpty ? '' : ':';
                return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                        "\u2022 ${ingredient.name}$dots ${ingredient.amount}",
                        style: Theme.of(context).textTheme.bodyLarge));
              },
            )));
  }
}
