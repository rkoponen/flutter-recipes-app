import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes_app/extensions/string_extension.dart';

import '../models/recipe.dart';

class RecipeCardWidget extends StatelessWidget {
  final Recipe recipe;
  final SearchController? controller;
  const RecipeCardWidget({super.key, required this.recipe, this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
          child: SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: Column(children: [
                SizedBox(
                    width: 400,
                    height: 150,
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: const Placeholder()))),
                ListTile(
                  title: Text(recipe.name.capitalize(),
                      style: Theme.of(context).textTheme.titleLarge),
                  subtitle: Text(recipe.description),
                )
              ])),
        ),
        onTap: () {
          context.push('/recipe/${recipe.id}');
          if (controller != null) controller!.closeView("");
        });
  }
}
