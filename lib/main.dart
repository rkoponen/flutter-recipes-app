import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/widgets/recipe_list_widget.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final snapshot = await _firestore.collection('recipes').get();
  snapshot.docs.forEach((doc) => print('${doc.id}: ${doc.data()}'));
  runApp(const ProviderScope(child: RecipeApp()));
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Recipes',
        theme: ThemeData(useMaterial3: true),
        home: HomeScreen());
  }
}
