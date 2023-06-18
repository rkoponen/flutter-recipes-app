import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/models/category.dart';
import 'package:recipes_app/providers/category_provider.dart';

class CategoryListWidget extends ConsumerWidget {
  final bool subset;

  const CategoryListWidget({super.key, required this.subset});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Category> categories = ref.watch(categoryProvider);
    if (subset) {
      categories = categories.take(3).toList();
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        final category = categories[index];
        return Card(
            child: ListTile(
          leading: const SizedBox(height: 30, width: 30, child: Placeholder()),
          title: Text(
              "${category.name[0].toUpperCase()}${category.name.substring(1)}"),
          subtitle: Text(category.description),
        ));
      },
    );
  }
}
