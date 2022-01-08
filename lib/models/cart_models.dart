import 'package:flutter/material.dart';

class CartModels {
  String id;
  String title;
  double price;
  int qty;

  CartModels({
    required this.id,
    required this.title,
    required this.price,
    required this.qty,
  });
}
