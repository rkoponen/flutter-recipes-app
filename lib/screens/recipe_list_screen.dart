import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/widgets/recipe_list_widget.dart';

class RecipeListScreen extends ConsumerWidget {
  String categoryName;

  RecipeListScreen({required this.categoryName, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 16),
        Text("Category: $categoryName",
            style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 16),
        RecipeListWidget(categoryName: categoryName)
      ],
    );
  }
}
