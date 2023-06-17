class Category {
  final String name;
  final String description;

  Category({required this.name, required this.description});

  factory Category.fromFirestore(Map<String, dynamic> data) {
    return Category(name: data['name'], description: data['description']);
  }
}
