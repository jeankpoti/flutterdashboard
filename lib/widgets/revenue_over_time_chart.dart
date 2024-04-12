import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class RevenueOverTimeChart extends StatefulWidget {
  const RevenueOverTimeChart({super.key});

  @override
  State<RevenueOverTimeChart> createState() => _RevenueOverTimeChartState();
}

class _RevenueOverTimeChartState extends State<RevenueOverTimeChart>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;
  late List<Animation<double>> _animationsTwo;
  final List<double> yValues = [2, 2.8, 3.2, 2.8, 2.6, 3.9, 2.5, 2.8];
  final List<double> yValuesTwo = [3, 3.8, 2.2, 3.8, 3.6, 1.9, 2, 3.8];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2), // duration of the animation
      vsync: this,
    );

    _animations = yValues
        .map((yValue) =>
            Tween<double>(begin: 0, end: yValue).animate(_controller))
        .toList();

    _animationsTwo = yValuesTwo
        .map((yValueTwo) =>
            Tween<double>(begin: 0, end: yValueTwo).animate(_controller))
        .toList();

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      TextStyle style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
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
        fontSize: 12,
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

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
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
                  spots: _animations.asMap().entries.map((entry) {
                    int index = entry.key;
                    Animation<double> animation = entry.value;
                    return FlSpot(
                        index.toDouble(), animation.value); // animated value
                  }).toList(),
                  isCurved: false,
                  color: Colors.orange,
                  barWidth: 2,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
                LineChartBarData(
                  spots: _animationsTwo.asMap().entries.map((entry) {
                    int index = entry.key;
                    Animation<double> animation = entry.value;
                    return FlSpot(
                        index.toDouble(), animation.value); // animated value
                  }).toList(),
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
        });
  }
}
