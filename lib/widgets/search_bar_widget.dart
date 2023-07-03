import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/providers/recipe_provider.dart';
import 'package:recipes_app/widgets/recipe_card_widget.dart';

import '../models/recipe.dart';

class SearchBarWidget extends ConsumerWidget {
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
    // TODO: implement build
    return SizedBox(
        width: 325,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: SearchAnchor.bar(
            barHintText: 'Search recipes',
            barShape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            viewHintText: 'Type a recipe name...',
            isFullScreen: true,
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              if (controller.text.isEmpty) {
                return <Widget>[
                  Center(child: Text("Results will be displayed here."))
                ];
              }
              return getSuggestions(controller, ref);
            },
          ),
        ));
  }
}
