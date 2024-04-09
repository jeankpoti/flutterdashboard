import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../util/responsive.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!Responsive.isDesktop(context))
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Icon(
                Icons.menu,
                color: AppColors.bodyColor,
              ),
            ),
          ),
        SizedBox(
          width: 800.w,
          height: 50.h,
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search anything here...',
                hintStyle:
                    TextStyle(color: AppColors.bodyColor, fontSize: 16.sp),
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.bodyColor,
                ),
                border: InputBorder.none,
              ),
              onChanged: (value) {},
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.download_outlined,
              color: AppColors.bodyColor,
            ),
            SizedBox(width: 10.w),
            const Icon(
              Icons.upload_outlined,
              color: AppColors.bodyColor,
            ),
            SizedBox(width: 10.w),
            const Icon(
              Icons.settings_outlined,
              color: AppColors.bodyColor,
            ),
            SizedBox(
              height: 40.h,
              child: VerticalDivider(
                color: AppColors.bodyColor.withOpacity(0.2),
                thickness: 1,
              ),
            ),
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.orange,
              child: const Icon(
                Icons.person_outline,
                color: AppColors.primaryColor,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down_outlined,
              color: AppColors.bodyColor,
            ),
            SizedBox(width: 16.w),
          ],
        ),
      ],
    );
  }
}
