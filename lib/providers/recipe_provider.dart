import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/recipe.dart';

class RecipeNotifier extends StateNotifier<List<Recipe>> {
  RecipeNotifier() : super([]) {
    _fetchRecipes();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _fetchRecipes() async {
    final snapshot = await _firestore.collection('recipes').get();
    final recipes = snapshot.docs.map((doc) {
      return Recipe.fromFirestore(doc.data(), doc.id);
    }).toList();
    state = recipes;
  }

  Recipe getRandomRecipe() {
    final recipes = List<Recipe>.from(state);
    recipes.shuffle();
    return recipes.first;
  }

  Recipe findRecipeById(String id) {
    final recipe = state.where((recipe) => recipe.id == id).first;
    return recipe;
  }

  List<Recipe> findRecipesByCategory(String categoryName) {
    final recipes =
        state.where((recipe) => recipe.categories.contains(categoryName));
    return recipes.toList();
  }
}

final recipeProvider = StateNotifierProvider<RecipeNotifier, List<Recipe>>(
    (ref) => RecipeNotifier());
