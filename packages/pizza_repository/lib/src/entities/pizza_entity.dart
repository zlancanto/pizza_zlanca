import 'package:pizza_repository/src/entities/macro_entity.dart';
import 'package:pizza_repository/src/models/macro.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  bool isVeg;
  int spicy;
  String name;
  String description;
  int price;
  int discount;
  Macro macros;

  PizzaEntity({
    required this.pizzaId,
    required this.picture,
    required this.isVeg,
    required this.spicy,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.macros,
  });

  Map<String, Object?> toDocument() {
    return {
      'pizzaId' : pizzaId,
      'picture' : picture,
      'isVeg' : isVeg,
      'spicy' : spicy,
      'name' : name,
      'description' : description,
      'price' : price,
      'discount' : discount,
      'macros' : macros.toEntity().toDocument(),
    };
  }

  static PizzaEntity fromDocument(Map<String, dynamic> doc) {
    return PizzaEntity(
        pizzaId: doc['pizzaId'],
        picture: doc['picture'],
        isVeg: doc['isVeg'],
        spicy: doc['spicy'],
        name: doc['name'],
        description: doc['description'],
        price: doc['price'],
        discount: doc['discount'],
        macros: Macro.fromEntity(MacroEntity.fromDocument(doc['macros'])),
    );
  }
}
