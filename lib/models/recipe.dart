import 'package:recipes_app/models/ingredient.dart';

class Recipe {
  final String id;
  final String name;
  final List<Ingredient> ingredients;
  final List<String> steps;

  Recipe(
      {required this.id,
      required this.name,
      required this.ingredients,
      required this.steps});

  factory Recipe.fromFirestore(Map<String, dynamic> data, String id) {
    List<Ingredient> ingredients = [];
    if (data['ingredients'] != null) {
      for (var ingredient in data['ingredients']) {
        ingredients.add(Ingredient.fromFirestore(
            {'name': ingredient['name'], 'amount': ingredient['amount']}));
      }
    }
    List<String> steps = [];
    if (data['steps'] != null) {
      for (var step in data['steps']) {
        steps.add(step.toString());
      }
    }

    return Recipe(
        id: id, name: data['name'], ingredients: ingredients, steps: steps);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'ingredients': ingredients.map((ingredient) => ingredient.toFirestore()),
      'steps': steps
    };
  }

  //toString() for testing
  @override
  String toString() {
    return "$name, ingredients: ${ingredients.map((ingredient) => ingredient.toFirestore())}, steps: $steps";
  }
}
