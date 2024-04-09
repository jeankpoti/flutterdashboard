import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

import '../models/stastic_model.dart';

class StatisticData {
  static List<StatisticModel> statisticItems = [
    const StatisticModel(
      title: 'Total Revenue',
      price: 32499.93,
      percentage: '12,95%',
      icon: Icons.arrow_upward_outlined,
      color: AppColors.secondary,
      isPrice: true,
    ),
    const StatisticModel(
      title: 'Profit',
      price: 12499.93,
      percentage: '0,33%',
      icon: Icons.arrow_downward_outlined,
      color: Colors.red,
      isPrice: true,
    ),
    const StatisticModel(
      title: 'Total Views',
      price: 5211832,
      percentage: '0,32%',
      icon: Icons.arrow_upward_outlined,
      color: AppColors.secondary,
      isPrice: true,
    ),
    const StatisticModel(
      title: 'Conversion Rate',
      price: 4.83,
      percentage: '8,05%',
      icon: Icons.arrow_upward_outlined,
      color: AppColors.secondary,
      isPrice: true,
    ),
  ];
}
