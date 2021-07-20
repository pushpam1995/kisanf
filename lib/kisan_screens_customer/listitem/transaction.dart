import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final String category;
  final double price;
  final int quantity;

  Transaction(
      {required this.quantity,required this.title, required this.category, required this.price});
}
