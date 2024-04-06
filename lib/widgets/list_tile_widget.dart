import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class ListileWidget extends StatefulWidget {
  final String imageUrl;
  final String countryName;
  final String sessionValue;
  final String percentage;
  final double jaugeValue;
  const ListileWidget({
    super.key,
    required this.imageUrl,
    required this.countryName,
    required this.sessionValue,
    required this.percentage,
    required this.jaugeValue,
  });

  @override
  State<ListileWidget> createState() => _ListileWidgetState();
}

class _ListileWidgetState extends State<ListileWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: widget.jaugeValue).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.imageUrl),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.countryName,
            style: AppTextStyles.body,
          ),
          Row(
            children: [
              Text(
                widget.sessionValue,
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.circle,
                color: AppColors.bodyColor,
                size: 10.r,
              ),
              SizedBox(width: 5.w),
              Text(
                widget.percentage,
                style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      subtitle: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              height: 8.h, // adjust as needed
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                gradient: LinearGradient(
                  colors: [
                    AppColors.secondary,
                    AppColors.secondary,
                    AppColors.bodyColor.withOpacity(0.2),
                    AppColors.bodyColor.withOpacity(0.2),
                  ],
                  stops: [
                    0.0,
                    _animation.value,
                    _animation.value,
                    1.0,
                  ],
                ),
              ),
            );
          }),
    );
  }
}
