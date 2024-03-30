import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class StatisticWidget extends StatelessWidget {
  final String title;
  final String price;
  final String percentage;
  final IconData icon;
  final Color color;
  const StatisticWidget({
    super.key,
    required this.title,
    required this.price,
    required this.percentage,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: AppColors.bodyColor.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.body,
            ),
            Text(
              price,
              style: AppTextStyles.title.copyWith(
                fontSize: 30.sp,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      icon,
                      size: 14.sp,
                      color: color,
                    ),
                    label: Text(
                      percentage,
                      style: AppTextStyles.body.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Text(
                    'Compared to last month',
                    style: AppTextStyles.body.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
