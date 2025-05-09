import 'package:pizza_repository/src/entities/macro_entity.dart';

class Macro {
  int calories;
  int proteins;
  int fat;
  int carbs;

  Macro({
    required this.calories,
    required this.proteins,
    required this.fat,
    required this.carbs,
  });

  MacroEntity toEntity() {
    return MacroEntity(
      calories: calories,
      proteins: proteins,
      fat: fat,
      carbs: carbs,
    );
  }

  static Macro fromEntity(MacroEntity entity) {
    return Macro(
      calories: entity.calories,
      proteins: entity.proteins,
      fat: entity.fat,
      carbs: entity.carbs,
    );
  }
}
