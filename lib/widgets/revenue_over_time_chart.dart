import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

class RevenueOverTimeChart extends StatelessWidget {
  const RevenueOverTimeChart({super.key});

  @override
  Widget build(BuildContext context) {
    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      TextStyle style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: AppColors.bodyColor.withOpacity(0.5),
      );
      Widget text;
      switch (value.toInt()) {
        case 1:
          text = Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Text('Jan 2024', style: style),
          );
          break;
        case 2:
          text = Text('Feb 2024', style: style);
          break;
        case 3:
          text = Text('Mar 2024', style: style);
          break;
        case 4:
          text = Text('Apr 2024', style: style);
          break;
        case 5:
          text = Text('May 2024', style: style);
          break;
        case 6:
          text = Text('June 2024', style: style);
          break;
        case 7:
          text = Text('July 2024', style: style);
          break;
        case 8:
          text = Text('Aug 2024', style: style);
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

    Widget rightTitlesWidgets(double value, TitleMeta meta) {
      TextStyle style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
        color: AppColors.bodyColor.withOpacity(0.5),
      );
      Widget text;

      switch (value.toInt()) {
        case 1.9:
          text = Text('\$0', style: style);
          break;
        case 2:
          text = Text('\$0', style: style);
          break;
        case 3:
          text = Text('\$10K', style: style);
          break;

        case 3.9:
          text = Text('\$50K', style: style);
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

    return LineChart(
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
              reservedSize: 28,
              interval: 1,
              getTitlesWidget: rightTitlesWidgets,
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        borderData: FlBorderData(
          border: Border(
            bottom: BorderSide(
                color: AppColors.bodyColor.withOpacity(0.2), width: 1),
            right: BorderSide(
              color: AppColors.bodyColor.withOpacity(0.2),
              width: 1,
            ),
            top: BorderSide.none,
            left: BorderSide.none,
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(1, 2),
              const FlSpot(2, 2.8),
              const FlSpot(3, 3.2),
              const FlSpot(4, 2.8),
              const FlSpot(5, 2.6),
              const FlSpot(6, 3.9),
              const FlSpot(7, 2.5),
              const FlSpot(8, 2.8),
            ],
            isCurved: false,
            color: Colors.orange,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
          LineChartBarData(
            spots: [
              const FlSpot(1, 3),
              const FlSpot(2, 3.8),
              const FlSpot(3, 2.2),
              const FlSpot(4, 3.8),
              const FlSpot(5, 3.6),
              const FlSpot(6, 1.9),
              const FlSpot(7, 2),
              const FlSpot(8, 3.8),
            ],
            isCurved: false,
            color: AppColors.secondary,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 2000), // Optional
      curve: Curves.ease, // Optional
    );
  }
}
