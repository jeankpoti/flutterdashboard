import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'revenue_over_time_chart.dart';

class RevenueOverTime extends StatelessWidget {
  const RevenueOverTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: MediaQuery.of(context).size.width / 2,
      height: 380.h,
      child: Padding(
        padding: EdgeInsets.all(16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Revenue Over Time',
                  style: AppTextStyles.title,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.download_outlined,
                      color: AppColors.bodyColor.withOpacity(0.5),
                    ),
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.more_horiz_outlined,
                      color: AppColors.bodyColor.withOpacity(0.5),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.secondary,
                          size: 15.r,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Total Revenue',
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.only(left: 18.w),
                      child: Row(
                        children: [
                          Text(
                            '\$ 32,839.99',
                            style: AppTextStyles.subtitle,
                          ),
                          SizedBox(width: 10.w),
                          Icon(
                            Icons.circle,
                            color: AppColors.bodyColor.withOpacity(0.5),
                            size: 10.r,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '55%',
                            style: AppTextStyles.body
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 30.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.orange,
                          size: 15.r,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Total Revenue',
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.only(left: 18.w),
                      child: Row(
                        children: [
                          Text(
                            '\$ 30,932.99',
                            style: AppTextStyles.subtitle,
                          ),
                          SizedBox(width: 10.w),
                          Icon(
                            Icons.circle,
                            color: AppColors.bodyColor.withOpacity(0.5),
                            size: 10.r,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '45%',
                            style: AppTextStyles.body
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 700.w,
              height: 200.h,
              child: const RevenueOverTimeChart(),
            ),
          ],
        ),
      ),
    );
  }
}
