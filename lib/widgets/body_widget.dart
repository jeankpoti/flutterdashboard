import 'package:dashboard/constants/app_colors.dart';
import 'package:dashboard/constants/app_text_styles.dart';
import 'package:dashboard/widgets/overview_widget.dart';
import 'package:dashboard/widgets/sales_by_region.dart';
import 'package:flutter/material.dart';

import '../util/responsive.dart';
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
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);

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
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Overview',
                  style: AppTextStyles.title,
                ),
                Row(
                  children: [
                    isMobile
                        ? const SizedBox.shrink()
                        : const OverviewWidget(
                            text: 'Customize Widget',
                            icon: Icons.dashboard_outlined,
                          ),
                    const SizedBox(width: 10),
                    const OverviewWidget(
                      text: 'Filter',
                      icon: Icons.filter_list_outlined,
                    ),
                    const SizedBox(width: 10),
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
          const SizedBox(
            height: 180,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8, top: 16, bottom: 8),
              child: StatisticWidget(
                isPrice: true,
                icon: Icons.arrow_upward_outlined,
                color: AppColors.secondary,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: isDesktop
                ? const Row(
                    children: [
                      // Revenue Over Time
                      Expanded(flex: 7, child: RevenueOverTime()),
                      SizedBox(width: 16),
                      // Session By Country
                      Expanded(flex: 4, child: SessionByCountry()),
                    ],
                  )
                : const Column(
                    children: [
                      // Revenue Over Time
                      SizedBox(
                        width: double.infinity,
                        child: Expanded(
                          child: RevenueOverTime(),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Session By Country
                      SizedBox(
                        width: double.infinity,
                        child: Expanded(
                          child: SessionByCountry(),
                        ),
                      ),
                    ],
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: !isMobile
                ? const Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: SalesByRegion(),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 5,
                        child: SalesByPlatform(),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 5,
                        child: RegisteredUsersWidget(),
                      ),
                    ],
                  )
                : const Column(
                    children: [
                      // Sales By Region
                      SizedBox(
                        width: double.infinity,
                        child: Expanded(
                          child: SalesByRegion(),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Sales By Platform
                      SizedBox(
                        width: double.infinity,
                        child: Expanded(
                          child: SalesByPlatform(),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Registered Users
                      SizedBox(
                        width: double.infinity,
                        child: Expanded(
                          child: RegisteredUsersWidget(),
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
