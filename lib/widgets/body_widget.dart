import 'package:dashboard/constants/app_colors.dart';
import 'package:dashboard/constants/app_text_styles.dart';
import 'package:dashboard/widgets/overview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'search_bar_widget.dart';
import 'statistic_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
      ],
    );
  }
}
