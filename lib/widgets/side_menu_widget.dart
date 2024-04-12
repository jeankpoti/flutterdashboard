import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../data/side_menu_data.dart';

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
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('LOGO'),
                    const SizedBox(width: 10),
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
            padding: const EdgeInsets.only(left: 16, bottom: 16),
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
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 16,
                      right: 16,
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6)),
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
