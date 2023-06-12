import 'package:flutter/material.dart';
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
    return Recipe(
        id: id,
        name: data['name'],
        ingredients: data['ingredients'],
        steps: data['steps']);
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
