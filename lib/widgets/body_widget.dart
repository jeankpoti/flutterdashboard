import 'package:dashboard/constants/app_colors.dart';
import 'package:dashboard/constants/app_text_styles.dart';
import 'package:dashboard/widgets/overview_widget.dart';
import 'package:dashboard/widgets/sales_by_region.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'registered_users_widget.dart';
import 'revenue_over_time.dart';
import 'sales_by_platform.dart';
import 'search_bar_widget.dart';
import 'session_by_country.dart';
import 'statistic_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
            child: SizedBox(
              height: 150.h,
              child: const StatisticWidget(
                isPrice: true,
                icon: Icons.arrow_upward_outlined,
                color: AppColors.secondary,
              ),
            ),

            //  Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Expanded(
            //       flex: 3,
            //       child: StatisticWidget(
            //         isPrice: true,
            //         title: 'Total Revenue',
            //         price: 32499.93,
            //         percentage: '12,95%',
            //         icon: Icons.arrow_upward_outlined,
            //         color: AppColors.secondary,
            //       ),
            //     ),
            //     SizedBox(width: 10.w),
            //     const Expanded(
            //       flex: 3,
            //       child: StatisticWidget(
            //         isPrice: true,
            //         title: 'Profit',
            //         price: 12499.93,
            //         percentage: '0,33%',
            //         icon: Icons.arrow_downward_outlined,
            //         color: Colors.red,
            //       ),
            //     ),
            //     SizedBox(width: 10.w),
            //     const Expanded(
            //       flex: 3,
            //       child: StatisticWidget(
            //         title: 'Total Views',
            //         price: 5211832,
            //         percentage: '0,32%',
            //         icon: Icons.arrow_upward_outlined,
            //         color: AppColors.secondary,
            //       ),
            //     ),
            //     SizedBox(width: 10.w),
            //     const Expanded(
            //       flex: 3,
            //       child: StatisticWidget(
            //         title: 'Conversion Rate',
            //         price: 4.83,
            //         percentage: '8,05%',
            //         icon: Icons.arrow_upward_outlined,
            //         color: AppColors.secondary,
            //       ),
            //     ),
            //   ],
            // ),
          ),

          Padding(
            padding: EdgeInsets.all(16.h),
            child: Row(
              children: [
                // Revenue Over Time
                const Expanded(flex: 7, child: RevenueOverTime()),
                SizedBox(width: 16.w),
                const Expanded(flex: 4, child: SessionByCountry()),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.h),
            child: const Row(
              children: [
                Expanded(
                  flex: 5,
                  child: SalesByRegion(),
                ),
                Expanded(
                  flex: 5,
                  child: SalesByPlatform(),
                ),
                Expanded(
                  flex: 5,
                  child: RegisteredUsersWidget(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
