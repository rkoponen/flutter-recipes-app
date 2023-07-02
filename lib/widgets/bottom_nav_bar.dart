import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/providers/recipe_provider.dart';

final indexProvider = StateProvider<int>((ref) => 0);

class BottomNavBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndex = ref.watch(indexProvider);
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.casino), label: 'Random recipe'),
        ],
        currentIndex: ref.watch(indexProvider),
        onTap: (index) {
          ref.read(indexProvider.notifier).state = index;
          selectedIndex = ref.watch(indexProvider);
          if (selectedIndex == 0) {
            context.push("/");
          } else if (selectedIndex == 1) {
            context.push("/category");
          } else if (selectedIndex == 2) {
            context.push(
                "/recipe/random/${ref.watch(recipeProvider.notifier).getRandomRecipe().id}");
          }
        });
  }
}
