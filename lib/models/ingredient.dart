class Ingredient {
  final String name;
  final String amount;

  Ingredient({required this.name, required this.amount});

  factory Ingredient.fromFirestore(Map<String, dynamic> data) {
    return Ingredient(name: data['name'], amount: data['amount']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'amount': amount,
    };
  }
}
