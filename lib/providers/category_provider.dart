import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes_app/models/category.dart';

class CategoryNotifier extends StateNotifier<List<Category>> {
  CategoryNotifier() : super([]) {
    _fetchCategories();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _fetchCategories() async {
    final snapshot = await _firestore.collection('categories').get();
    final categories = snapshot.docs.map((doc) {
      return Category.fromFirestore(doc.data());
    }).toList();
    state = categories;
  }
}

final categoryProvider =
    StateNotifierProvider<CategoryNotifier, List<Category>>(
        (ref) => CategoryNotifier());
