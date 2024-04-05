import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'list_tile_widget.dart';

class SessionByCountry extends StatelessWidget {
  const SessionByCountry({super.key});

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
      width: MediaQuery.of(context).size.width / 3.9,
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
                Column(
                  children: [
                    Text(
                      'Session by Country',
                      style: AppTextStyles.title,
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      'Showing data for Top Session',
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
                Icon(
                  Icons.more_horiz_outlined,
                  color: AppColors.bodyColor.withOpacity(0.5),
                )
              ],
            ),
            SizedBox(height: 20.h),
            const ListileWidget(
              imageUrl: 'assets/images/togo.jpg',
              countryName: 'Togo',
              sessionValue: '1,345',
              percentage: '80%',
              jaugeValue: 0.8,
            ),
            const ListileWidget(
              imageUrl: 'assets/images/usa.jpeg',
              countryName: 'USA',
              sessionValue: '1,245',
              percentage: '70%',
              jaugeValue: 0.7,
            ),
            const ListileWidget(
              imageUrl: 'assets/images/austra.jpg',
              countryName: 'Australia',
              sessionValue: '1,145',
              percentage: '60%',
              jaugeValue: 0.6,
            ),
            const ListileWidget(
              imageUrl: 'assets/images/brazil.jpg',
              countryName: 'Brazil',
              sessionValue: '1,045',
              percentage: '40%',
              jaugeValue: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
