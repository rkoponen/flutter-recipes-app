import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/breakpoints.dart';
import 'package:recipes_app/extensions/string_extension.dart';
import 'package:recipes_app/widgets/category_list_widget.dart';
import 'package:recipes_app/widgets/recipe_list_widget.dart';

class CategoryScreen extends ConsumerWidget {
  final bool backButton;

  const CategoryScreen({required this.backButton, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return width < Breakpoints.lg
        ? CategoryMobileLayout(backButton: backButton)
        : const CategoryDesktopLayout();
  }
}

final selectionProvider = StateProvider((ref) => 'appetizer');

class CategoryDesktopLayout extends ConsumerWidget {
  const CategoryDesktopLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryName = ref.watch(selectionProvider);

    return Container(
        color: Colors.white,
        child: Row(children: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    Text(
                      "Categories",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    const CategoryListWidget(
                      subset: false,
                      mobileLayout: false,
                      categoryScreen: true,
                    )
                  ]))),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
                    Text("Selected category: ${categoryName.capitalize()}",
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 10),
                    Expanded(
                        child: ListView(children: [
                      RecipeListWidget(categoryName: categoryName)
                    ]))
                  ]))),
        ]));
  }
}

class CategoryMobileLayout extends ConsumerWidget {
  final bool backButton;

  const CategoryMobileLayout({required this.backButton, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (backButton) const BackButton(),
                        Text("Categories",
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Center(
                        child: CategoryListWidget(
                            subset: false,
                            mobileLayout: true,
                            categoryScreen: false))
                  ],
                ))));
  }
}
