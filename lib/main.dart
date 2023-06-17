import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/routes/router.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final snapshot = await _firestore.collection('recipes').get();
  snapshot.docs.forEach((doc) => print('${doc.id}: ${doc.data()}'));
  runApp(ProviderScope(
      child: MaterialApp.router(
          routerConfig: router, theme: ThemeData(useMaterial3: true))));
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
