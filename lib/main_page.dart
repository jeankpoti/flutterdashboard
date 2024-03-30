import 'package:flutter/material.dart';

import 'widgets/body_widget.dart';
import 'widgets/side_menu_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: SideMenuWidget(),
          ),
          Expanded(
            flex: 11,
            child: BodyWidget(),
          ),
        ],
      ),
    );
  }
}
