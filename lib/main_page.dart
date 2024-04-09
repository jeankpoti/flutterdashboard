import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'util/responsive.dart';
import 'widgets/body_widget.dart';
import 'widgets/side_menu_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer: isDesktop
          ? null
          : SizedBox(
              width: 350.w,
              child: const SideMenuWidget(),
            ),
      body: Row(
        children: [
          if (isDesktop)
            const Expanded(
              flex: 3,
              child: SideMenuWidget(),
            ),
          const Expanded(
            flex: 11,
            child: BodyWidget(),
          ),
        ],
      ),
    );
  }
}
