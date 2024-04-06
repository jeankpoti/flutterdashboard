import 'package:dashboard/constants/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import '../constants/app_colors.dart';

class RegisteredUsersWidget extends StatefulWidget {
  const RegisteredUsersWidget({Key? key}) : super(key: key);

  @override
  State<RegisteredUsersWidget> createState() => _RegisteredUsersWidgetState();
}

class _RegisteredUsersWidgetState extends State<RegisteredUsersWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2), // duration of the animation
      vsync: this,
    );

    _animation =
        Tween<double>(begin: 0, end: 0.75).animate(_controller) // 75% progress
          ..addListener(() {
            setState(() {});
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Registred users',
                        style: AppTextStyles.subtitle,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'An overview of your users',
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.more_horiz_outlined,
                    color: AppColors.bodyColor.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0.h),
                  child: Center(
                    child: SizedBox(
                      height: 150.h,
                      width: 150.w,
                      child: CircularProgressIndicator(
                        value: _animation.value, // 50% progress
                        strokeWidth: 10,
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.secondary),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 30.h,
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30.h,
                        color: AppColors.secondary,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '2,324',
                        style: AppTextStyles.title,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Total Users',
                        style: AppTextStyles.body,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 32.h,
                bottom: 16.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 40.h,
                        child: const VerticalDivider(
                          color: AppColors.secondary,
                          thickness: 5,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1,809',
                            style: AppTextStyles.subtitle,
                          ),
                          Text(
                            'Premium Plan',
                            style: AppTextStyles.body,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                    child: VerticalDivider(
                      color: AppColors.bodyColor.withOpacity(0.2),
                      thickness: 2,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '515',
                            style: AppTextStyles.subtitle,
                          ),
                          Text(
                            'basic Plan',
                            style: AppTextStyles.body,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                        child: VerticalDivider(
                          color: AppColors.bodyColor.withOpacity(0.2),
                          thickness: 5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
