import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../util/responsive.dart';
import 'revenue_over_time_chart.dart';

class RevenueOverTime extends StatelessWidget {
  const RevenueOverTime({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8),
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
      height: 380,
      child: Padding(
        padding: const EdgeInsets.all(16),
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
                    const SizedBox(width: 10),
                    Icon(
                      Icons.more_horiz_outlined,
                      color: AppColors.bodyColor.withOpacity(0.5),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isMobile
                    ? const SizedBox.shrink()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.circle,
                                color: AppColors.secondary,
                                size: 15,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Total Revenue',
                                style: AppTextStyles.body,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Row(
                              children: [
                                Text(
                                  '\$ 32,839.99',
                                  style: AppTextStyles.subtitle,
                                ),
                                const SizedBox(width: 10),
                                Icon(
                                  Icons.circle,
                                  color: AppColors.bodyColor.withOpacity(0.5),
                                  size: 10,
                                ),
                                const SizedBox(width: 10),
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
                const SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.orange,
                          size: 15,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Total Revenue',
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: Row(
                        children: [
                          Text(
                            '\$ 30,932.99',
                            style: AppTextStyles.subtitle,
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.circle,
                            color: AppColors.bodyColor.withOpacity(0.5),
                            size: 10,
                          ),
                          const SizedBox(width: 10),
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
            const SizedBox(height: 20),
            SizedBox(
              width: 700,
              height: isMobile ? 150 : 200,
              child: const RevenueOverTimeChart(),
            ),
          ],
        ),
      ),
    );
  }
}
