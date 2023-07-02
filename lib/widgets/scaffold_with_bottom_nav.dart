import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';

class ScaffoldWithBottomNav extends StatelessWidget {
  final Widget child;
  const ScaffoldWithBottomNav({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColorLight,
          title: const Text("Recipes App"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => print("Search pressed."),
            )
          ],
        ),
        body: child,
        bottomNavigationBar: const BottomNavBar());
  }
}
