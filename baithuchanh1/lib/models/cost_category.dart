import 'package:flutter/material.dart';

class CostCategory {
  final String title;
  final String amount;
  final String? status;
  final IconData icon;
  final Color color;

  CostCategory({
    required this.title,
    required this.amount,
    this.status,
    required this.icon,
    required this.color,
  });
}
