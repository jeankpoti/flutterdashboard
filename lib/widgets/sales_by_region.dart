import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class SalesByRegion extends StatelessWidget {
  const SalesByRegion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.h),
      child: Container(
        height: 350.h,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 16.h, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sales by region',
                    style: AppTextStyles.subtitle,
                  ),
                  Icon(
                    Icons.more_horiz_outlined,
                    color: AppColors.bodyColor.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300.h,
              child: RadarChart(
                RadarChartData(
                  dataSets: [
                    RadarDataSet(
                      dataEntries: [
                        const RadarEntry(value: 3),
                        const RadarEntry(value: 2),
                        const RadarEntry(value: 5),
                        const RadarEntry(value: 3),
                        const RadarEntry(value: 4),
                        const RadarEntry(value: 2),
                      ],
                    ),
                  ],
                  borderData: FlBorderData(
                    show: false,
                  ),
                  radarBackgroundColor: Colors.transparent,
                  radarBorderData: BorderSide(
                    color: AppColors.bodyColor.withOpacity(0.2),
                  ),
                  tickBorderData: BorderSide(
                    color: AppColors.bodyColor.withOpacity(0.2),
                  ),
                  tickCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
