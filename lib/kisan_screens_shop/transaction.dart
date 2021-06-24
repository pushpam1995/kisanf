import 'package:flutter/material.dart';
class Transaction {
  final String title;
  final String category;
  final double price;

  Transaction(
      {
      required this.title,
      required this.category,
        required this.price});
}
