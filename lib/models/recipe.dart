import 'package:recipes_app/models/category.dart';
import 'package:recipes_app/models/ingredient.dart';

class Recipe {
  final String id;
  final String name;
  final String description;
  final List<Ingredient> ingredients;
  final List<String> steps;
  final List<Category> categories;

  Recipe(
      {required this.id,
      required this.name,
      required this.description,
      required this.ingredients,
      required this.steps,
      required this.categories});

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
    List<Category> categories = [];
    if (data['categories'] != null) {
      for (var category in data['categories']) {
        categories.add(Category.fromFirestore({
          'name': category['name'],
          'description': category['description']
        }));
      }
    }

    return Recipe(
        id: id,
        name: data['name'],
        description: data['description'],
        ingredients: ingredients,
        steps: steps,
        categories: categories);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'ingredients': ingredients.map((ingredient) => ingredient.toFirestore()),
      'steps': steps,
      'categories': categories.map((category) => category.name)
    };
  }

  //toString() for testing
  @override
  String toString() {
    return "$name, ingredients: ${ingredients.map((ingredient) => ingredient.toFirestore())}, steps: $steps";
  }
}
