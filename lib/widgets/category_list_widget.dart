import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/models/category.dart';
import 'package:recipes_app/providers/category_provider.dart';
import 'package:recipes_app/screens/category_screen.dart';

final selectedTile = StateProvider<int?>((ref) => 0);

class CategoryListWidget extends ConsumerWidget {
  final bool subset;
  final bool mobileLayout;
  final bool categoryScreen;

  const CategoryListWidget(
      {super.key,
      required this.subset,
      required this.mobileLayout,
      required this.categoryScreen});

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
        final selected = ref.watch(selectedTile);

        Color color;
        if (categoryScreen) {
          color = selected == index
              ? Theme.of(context).primaryColor
              : Theme.of(context).cardColor;
        } else {
          color = Theme.of(context).cardColor;
        }

        return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
                color: color,
                child: ListTile(
                    leading: const SizedBox(
                        height: 30, width: 30, child: Placeholder()),
                    title: Text(
                        "${category.name[0].toUpperCase()}${category.name.substring(1)}"),
                    subtitle: Text(category.description),
                    onTap: () {
                      mobileLayout
                          ? context.push("/category/${category.name}")
                          : ref
                              .watch(selectionProvider.notifier)
                              .update((state) => category.name);
                      ref.read(selectedTile.notifier).update((state) => index);
                      print(selected);
                    })));
      },
    );
  }
}
