import 'package:flutter/material.dart';

import '../models/menu_model.dart';

class SideMenuData {
  static List<MenuModel> sideMenuItems = [
    MenuModel(
      title: 'Overview',
      icon: Icons.home_outlined,
    ),
    MenuModel(
      title: 'Performance',
      icon: Icons.auto_graph_sharp,
    ),
    MenuModel(
      title: 'Campaigns',
      icon: Icons.campaign_outlined,
    ),
    MenuModel(
      title: 'Orders',
      icon: Icons.shopping_cart_outlined,
    ),
    MenuModel(
      title: 'Products',
      icon: Icons.production_quantity_limits_outlined,
    ),
    MenuModel(
      title: 'Message',
      icon: Icons.message_outlined,
    ),
    MenuModel(
      title: 'Sales Platform',
      icon: Icons.shopping_bag_outlined,
    ),
    MenuModel(
      title: 'Demo Mode',
      icon: Icons.developer_mode_outlined,
    ),
    MenuModel(
      title: 'Feedback',
      icon: Icons.feedback_outlined,
    ),
    MenuModel(
      title: 'Help and docs',
      icon: Icons.help_outline,
    ),
  ];
}
