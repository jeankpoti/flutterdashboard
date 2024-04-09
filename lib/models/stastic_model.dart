import 'package:flutter/material.dart';

class StatisticModel {
  final String title;
  final double price;
  final String percentage;
  final IconData icon;
  final Color color;
  final bool isPrice;
  const StatisticModel({
    required this.title,
    required this.price,
    required this.percentage,
    required this.icon,
    required this.color,
    this.isPrice = false,
  });
}
