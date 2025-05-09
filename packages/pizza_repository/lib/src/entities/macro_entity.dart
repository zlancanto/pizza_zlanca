class MacroEntity {
  int calories;
  int proteins;
  int fat;
  int carbs;

  MacroEntity({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs,
  });

  Map<String, Object?> toDocument() {
    return {
      'calories': calories,
      'proteins': proteins,
      'fat': fat,
      'carbs': carbs,
    };
  }

  static MacroEntity fromDocument(Map<String, dynamic> doc) {
    return MacroEntity(
        calories: doc['calories'],
        proteins: doc['proteins'],
        fat: doc['fat'],
        carbs: doc['carbs'],
    );
  }
}