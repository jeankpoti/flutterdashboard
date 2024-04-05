import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class ListileWidget extends StatelessWidget {
  final String imageUrl;
  final String countryName;
  final String sessionValue;
  final String percentage;
  final double jaugeValue;
  const ListileWidget({
    super.key,
    required this.imageUrl,
    required this.countryName,
    required this.sessionValue,
    required this.percentage,
    required this.jaugeValue,
  });

  @override
  Widget build(BuildContext context) {
    var w;
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imageUrl),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            countryName,
            style: AppTextStyles.body,
          ),
          Row(
            children: [
              Text(
                sessionValue,
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.circle,
                color: AppColors.bodyColor,
                size: 10.r,
              ),
              SizedBox(width: 5.w),
              Text(
                percentage,
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      subtitle: Container(
        height: 8.h, // adjust as needed
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          gradient: LinearGradient(
            colors: [
              AppColors.secondary,
              AppColors.secondary,
              AppColors.bodyColor.withOpacity(0.2),
              AppColors.bodyColor.withOpacity(0.2),
            ],
            stops: [
              0.0,
              jaugeValue,
              jaugeValue,
              1.0,
            ],
          ),
        ),
      ),
    );
  }
}
