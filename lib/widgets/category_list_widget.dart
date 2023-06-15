import 'package:flutter/material.dart';
import 'package:recipes_app/models/category.dart';

class CategoryListWidget extends StatelessWidget {
  final bool allCategories;

  CategoryListWidget(this.allCategories);

  @override
  Widget build(BuildContext context) {
    List<RecipeCategory>? categories;
    if (!allCategories) {
      categories = [
        RecipeCategory.main,
        RecipeCategory.breakfast,
        RecipeCategory.salad
      ];
    } else {
      categories = RecipeCategory.values;
    }

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final category = categories![index];
        return SizedBox(
            width: double.infinity,
            height: 64,
            child: Card(
                child: ListTile(
                    leading:
                        SizedBox(height: 30, width: 30, child: Placeholder()),
                    title: Text(
                        "${category.name[0].toUpperCase()}${category.name.substring(1)}"),
                    subtitle: Text(categoryDescriptions[category]!))));
      },
    );
  }
}
