import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/widgets/recipe_list_widget.dart';

class RecipeListScreen extends ConsumerWidget {
  final String categoryName;

  const RecipeListScreen({required this.categoryName, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const BackButton(),
            const SizedBox(width: 16),
            Text("Category: $categoryName",
                style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const SizedBox(height: 16),
        RecipeListWidget(categoryName: categoryName)
      ],
    );
  }
}
