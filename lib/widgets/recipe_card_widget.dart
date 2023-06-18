import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/recipe.dart';

class RecipeCardWidget extends StatelessWidget {
  final Recipe recipe;
  const RecipeCardWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            height: 150,
            child: Column(children: [
              Expanded(
                child: SizedBox(
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: const Placeholder()))),
              ),
              ListTile(
                onTap: () => context.push('/recipe/${recipe.id}'),
                title: Text(recipe.name),
                subtitle: Text(recipe.description),
                trailing: const Icon(Icons.favorite_border_rounded),
              )
            ])));
  }
}
