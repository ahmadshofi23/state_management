import 'package:flutter/cupertino.dart';
import 'package:state_management/models/cart_models.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModels> _items = {};

  Map<String, CartModels> get items => _items;

  int get jumlah {
    return _items.length;
    // notifyListeners();
  }

  double get total {
    var totalAmount = 0;
    _items.forEach((key, CartModels) {
      totalAmount += CartModels.qty * CartModels.price.toInt();
    });
    return totalAmount.toDouble();
    // notifyListeners();
  }

  void addCart(String prodId, String title, double price) {
    if (_items.containsKey(prodId)) {
      //ketika sudah tersedia
      _items.update(
        prodId,
        (value) => CartModels(
          id: value.id,
          title: value.title,
          price: value.price,
          qty: value.qty + 1,
        ),
      );
    } else {
      //kondisi nambah baru
      _items.putIfAbsent(
        prodId,
        () => CartModels(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          qty: 1,
        ),
      );
    }
    notifyListeners();
  }
}
