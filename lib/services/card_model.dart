import 'package:flutter/material.dart';

import '../models/product.dart';

class CardModel extends ChangeNotifier {
  final List<Product> _cardProduct = [];

  List<Product> get cardProduct => _cardProduct;

  void addCard(Product product) {
    _cardProduct.add(product);
    notifyListeners();
  }

  void removeCard(int productIndex) {
    _cardProduct.removeAt(productIndex);
    notifyListeners();
  }
}
