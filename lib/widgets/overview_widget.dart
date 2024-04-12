import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class OverviewWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const OverviewWidget({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.bodyColor.withOpacity(0.2),
        ),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(
          icon,
          color: AppColors.bodyColor,
        ),
        label: Text(
          text,
          style: AppTextStyles.body,
        ),
      ),
    );
  }
}
