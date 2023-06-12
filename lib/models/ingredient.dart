class Ingredient {
  final String name;
  final String amount;

  Ingredient({required this.name, required this.amount});

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'amount': amount,
    };
  }
}
