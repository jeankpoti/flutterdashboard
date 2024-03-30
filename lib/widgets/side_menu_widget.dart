import 'package:dashboard/constants/app_colors.dart';
import 'package:dashboard/constants/app_text_styles.dart';
import 'package:dashboard/data/side_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0, hoverIndex = 0;
  @override
  Widget build(BuildContext context) {
    final data = SideMenuData.sideMenuItems;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 16.h,
              left: 16.w,
              right: 16.w,
              bottom: 32.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('LOGO'),
                    SizedBox(width: 10.h),
                    Text(
                      'Consist',
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),
                const Icon(
                  Icons.menu,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 16.h),
            child: Text(
              'Main menu'.toUpperCase(),
              style: AppTextStyles.body,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => setState(() {
                    selectedIndex = index;
                  }),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 5.h,
                      left: 16.w,
                      right: 16.w,
                    ),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onHover: (event) => setState(() {
                        hoverIndex = index;
                      }),
                      onExit: (event) => setState(() {
                        hoverIndex = -1;
                      }),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.r)),
                          color: isSelected && data[index].title != 'Demo Mode'
                              ? AppColors.secondary
                              : (hoverIndex == index
                                  ? Colors.grey[300]
                                  : Colors.white),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                data[index].icon,
                                color: isSelected &&
                                        data[index].title != 'Demo Mode'
                                    ? Colors.white
                                    : AppColors.bodyColor,
                              ),
                              title: Text(
                                data[index].title,
                                style: TextStyle(
                                  color: isSelected &&
                                          data[index].title != 'Demo Mode'
                                      ? Colors.white
                                      : AppColors.bodyColor,
                                ),
                              ),
                              trailing: data[index].title == 'Demo Mode'
                                  ? Transform.scale(
                                      scale: 0.5,
                                      child: Switch(
                                        value: false,
                                        activeColor: AppColors.secondary,
                                        inactiveThumbColor: AppColors.bodyColor,
                                        onChanged: (value) {},
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            if (data[index].title == 'Sales Platform')
                              const Divider(
                                color: Colors.grey,
                                height: 1,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
