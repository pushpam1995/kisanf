import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final String category;
  final double price;
  final int quantity;
  final int itemId;
  final String description;
  final int shopId;
  final int categoryId;

  Transaction({
    required this.title,
    required this.category,
    required this.price,
    required this.quantity,
    required this.itemId,
    required this.categoryId,
    required this.description,
    required this.shopId,
  });
}
