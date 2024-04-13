import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../util/responsive.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!Responsive.isDesktop(context))
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: const Icon(
                Icons.menu,
                color: AppColors.bodyColor,
              ),
            ),
          ),
        SizedBox(
          width: width * 0.6,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search anything here...',
                hintStyle: TextStyle(color: AppColors.bodyColor, fontSize: 16),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.bodyColor,
                ),
                border: InputBorder.none,
              ),
              onChanged: (value) {},
            ),
          ),
        ),
        if (MediaQuery.of(context).size.width >= 1255)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.download_outlined,
                color: AppColors.bodyColor,
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.upload_outlined,
                color: AppColors.bodyColor,
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.settings_outlined,
                color: AppColors.bodyColor,
              ),
              SizedBox(
                height: 40,
                child: VerticalDivider(
                  color: AppColors.bodyColor.withOpacity(0.2),
                  thickness: 1,
                ),
              ),
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.orange,
                child: Icon(
                  Icons.person_outline,
                  color: AppColors.primaryColor,
                ),
              ),
              const Icon(
                Icons.arrow_drop_down_outlined,
                color: AppColors.bodyColor,
              ),
              const SizedBox(width: 16),
            ],
          )
        else if (isMobile)
          const Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.orange,
                child: Icon(
                  Icons.person_outline,
                  color: AppColors.primaryColor,
                ),
              ),
              Icon(
                Icons.arrow_drop_down_outlined,
                color: AppColors.bodyColor,
              ),
            ],
          ),
        const SizedBox(width: 16),
      ],
    );
  }
}
