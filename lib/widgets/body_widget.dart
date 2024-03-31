import 'package:dashboard/constants/app_colors.dart';
import 'package:dashboard/constants/app_text_styles.dart';
import 'package:dashboard/widgets/overview_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'search_bar_widget.dart';
import 'statistic_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
      Widget text;
      switch (value.toInt()) {
        case 2:
          text = const Text('SEPT', style: style);
          break;
        case 7:
          text = const Text('OCT', style: style);
          break;
        case 12:
          text = const Text('DEC', style: style);
          break;
        default:
          text = const Text('');
          break;
      }

      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        child: text,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search bar
        const SearchbarWidget(),
        Divider(
          color: AppColors.bodyColor.withOpacity(0.2),
        ),

        Padding(
          padding: EdgeInsets.all(16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Overview',
                style: AppTextStyles.title,
              ),
              Row(
                children: [
                  const OverviewWidget(
                    text: 'Customize Widget',
                    icon: Icons.dashboard_outlined,
                  ),
                  SizedBox(width: 10.w),
                  const OverviewWidget(
                    text: 'Filter',
                    icon: Icons.filter_list_outlined,
                  ),
                  SizedBox(width: 10.w),
                  const OverviewWidget(
                    text: 'Share',
                    icon: Icons.share_outlined,
                  ),
                ],
              )
            ],
          ),
        ),
        Divider(
          color: AppColors.bodyColor.withOpacity(0.2),
        ),
        Padding(
          padding: EdgeInsets.all(16.h),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatisticWidget(
                title: 'Total Revenue',
                price: '\$ 32,499.93',
                percentage: '12,95%',
                icon: Icons.arrow_upward_outlined,
                color: AppColors.secondary,
              ),
              StatisticWidget(
                title: 'Profit',
                price: '\$ 10,499.93',
                percentage: '0,33%',
                icon: Icons.arrow_downward_outlined,
                color: Colors.red,
              ),
              StatisticWidget(
                title: 'Total Views',
                price: '5,211,832',
                percentage: '0,32%',
                icon: Icons.arrow_upward_outlined,
                color: AppColors.secondary,
              ),
              StatisticWidget(
                title: 'Conversion Rate',
                price: '4,83%',
                percentage: '8,05%',
                icon: Icons.arrow_upward_outlined,
                color: AppColors.secondary,
              ),
            ],
          ),
        ),

        // Revenue Over Time
        Padding(
          padding: EdgeInsets.all(16.h),
          child: Container(
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
            width: 600.w,
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
                    width: 550.w,
                    height: 200.h,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: false),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 32,
                              interval: 1,
                              getTitlesWidget: bottomTitleWidgets,
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                        ),
                        borderData: FlBorderData(
                          border: const Border(
                            bottom: BorderSide(color: Colors.black, width: 2),
                            right: BorderSide(color: Colors.black, width: 2),
                            top: BorderSide.none,
                            left: BorderSide.none,
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(1, 1),
                              FlSpot(3, 2.8),
                              FlSpot(7, 1.2),
                              FlSpot(10, 2.8),
                              FlSpot(12, 2.6),
                              FlSpot(13, 3.9),
                            ],
                            isCurved: false,
                            color: Colors.orange,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                          ),
                          LineChartBarData(
                            // spots: [
                            //   FlSpot(0, 0),
                            //   FlSpot(1, 10000),
                            //   FlSpot(2, 20000),
                            // ],
                            isCurved: false,
                            color: AppColors.secondary,
                            barWidth: 2,
                            isStrokeCapRound: true,
                            dotData: const FlDotData(show: false),
                            belowBarData: BarAreaData(show: false),
                          ),
                        ],
                      ),
                      duration: const Duration(milliseconds: 150), // Optional
                      curve: Curves.linear, // Optional
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
