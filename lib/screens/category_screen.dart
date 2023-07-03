import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/widgets/category_list_widget.dart';

class CategoryScreen extends ConsumerWidget {
  final bool backButton;

  const CategoryScreen({required this.backButton, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    if (backButton) BackButton(),
                    Text("Categories",
                        style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                SizedBox(height: 16),
                const Center(child: CategoryListWidget(subset: false)),
              ],
            )));
  }
}
