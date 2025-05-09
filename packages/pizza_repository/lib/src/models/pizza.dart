import 'package:pizza_repository/src/entities/entities.dart';
import 'package:pizza_repository/src/models/macro.dart';

class Pizza {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macro macros;

  Pizza({
    required this.pizzaId,
    required this.picture,
    required this.isVeg,
    required this.spicy,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros
  });

  PizzaEntity toEntity() {
    return PizzaEntity(
        pizzaId: pizzaId,
        picture: picture,
        isVeg: isVeg,
        spicy: spicy,
        name: name,
        description: description,
        price: price,
        discount: discount,
        macros: macros
    );
  }

  static Pizza fromEntity(PizzaEntity entity) {
    return Pizza(
        pizzaId: entity.pizzaId,
        picture: entity.picture,
        isVeg: entity.isVeg,
        spicy: entity.spicy,
        name: entity.name,
        description: entity.description,
        price: entity.price,
        discount: entity.discount,
        macros: entity.macros
    );
  }
}
