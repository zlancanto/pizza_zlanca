import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza_repository/pizza_repository.dart';

class FirebasePizzaRepo implements PizzaRepo {
  final pizzaCollection = FirebaseFirestore.instance.collection('pizzas');

  Future<List<Pizza>> getPizzas() async {
    try {
      return await pizzaCollection.get().then(
        (value) =>
            value.docs
                .map(
                  (doc) =>
                      Pizza.fromEntity(PizzaEntity.fromDocument(doc.data()))
                )
                .toList()
      );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
