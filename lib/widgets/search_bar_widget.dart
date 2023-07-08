import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/breakpoints.dart';
import 'package:recipes_app/providers/recipe_provider.dart';
import 'package:recipes_app/widgets/recipe_card_widget.dart';

import '../models/recipe.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  Iterable<Widget> getSuggestions(SearchController controller, WidgetRef ref) {
    final String input = controller.value.text;
    final List<Recipe> recipes =
        ref.watch(recipeProvider.notifier).findRecipesByName(input);
    return recipes.map(
      (recipe) => RecipeCardWidget(recipe: recipe, controller: controller),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return SizedBox(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: SearchAnchor.bar(
            barHintText: 'Search recipes',
            barShape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            viewHintText: 'Type a recipe name...',
            isFullScreen: width > Breakpoints.lg ? false : true,
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              if (controller.text.isEmpty) {
                return <Widget>[
                  const Center(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Search something!"))),
                ];
              }
              return getSuggestions(controller, ref);
            },
          ),
        ));
  }
}
