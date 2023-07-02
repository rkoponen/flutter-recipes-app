import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/widgets/category_list_widget.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(height: 16),
        Text("Categories", style: Theme.of(context).textTheme.titleLarge),
        const CategoryListWidget(subset: false)
      ],
    ));
  }
}
