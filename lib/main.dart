import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/routes/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(
      child: MaterialApp.router(
          routerConfig: router,
          theme: ThemeData(
              primaryColor: const Color.fromARGB(255, 255, 197, 194),
              fontFamily: 'Noto Serif',
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
              scaffoldBackgroundColor:
                  const Color.fromARGB(255, 255, 255, 255)))));
}
