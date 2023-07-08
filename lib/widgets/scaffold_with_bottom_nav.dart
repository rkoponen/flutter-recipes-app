import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/widgets/search_bar_widget.dart';

import 'bottom_nav_bar.dart';

class ScaffoldWithBottomNav extends ConsumerWidget {
  final Widget child;
  const ScaffoldWithBottomNav({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: const Icon(Icons.soup_kitchen),
          actions: const <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20), child: SearchBarWidget())
          ],
        ),
        body: child,
        bottomNavigationBar: const BottomNavBar());
  }
}
