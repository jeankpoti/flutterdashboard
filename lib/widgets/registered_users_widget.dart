import 'package:dashboard/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class RegisteredUsersWidget extends StatefulWidget {
  const RegisteredUsersWidget({super.key});

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
    return Container(
      height: 350,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
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
                    const SizedBox(height: 5),
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
          const SizedBox(height: 30),
          Stack(
            children: [
              Center(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: _animation.value, // 50% progress
                    strokeWidth: 10,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.secondary),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 30,
                child: Column(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 30,
                      color: AppColors.secondary,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '2,324',
                      style: AppTextStyles.title,
                    ),
                    const SizedBox(height: 5),
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
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
              top: 32,
              bottom: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      height: 40,
                      child: VerticalDivider(
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
                  height: 40,
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
                      height: 40,
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
    );
  }
}
