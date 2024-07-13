import 'package:flutter/material.dart';
import 'package:task_3/models/product_model.dart';

class Cart with ChangeNotifier {
  Map<String, ProductModel> _items = {};

  Map<String, ProductModel> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, ProductModel) {
      total += ProductModel.price * ProductModel.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title, String image) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => ProductModel(
          id: existingCartItem.id,
          label: existingCartItem.label,
          image: existingCartItem.image,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => ProductModel(
          id: DateTime.now().toString(),
          label: title,
          image: image,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => ProductModel(
          id: existingCartItem.id,
          label: existingCartItem.label,
          image: existingCartItem.image,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
        ),
      );
    } else {
      _items.remove(productId);
    }

    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
