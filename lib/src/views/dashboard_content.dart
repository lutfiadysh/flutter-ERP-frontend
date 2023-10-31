import 'package:admin_dashboard/proy/providers/auth_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/image.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/utils/routes.dart';
import 'package:admin_dashboard/src/views/dashboard/dashboard.dart';
import 'package:admin_dashboard/src/views/dashboard/inventory.dart';
import 'package:admin_dashboard/src/views/dashboard/listings.dart';
import 'package:admin_dashboard/src/views/user/profile_page.dart';
import 'package:admin_dashboard/src/views/users/users_page.dart';
import 'package:admin_dashboard/src/widget/bottom_nav_menu.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  var pageController = PageController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Dashboard(),
          Inventory(),
          Listings(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xFF1C3949),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavMenu(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                    pageController.jumpToPage(0);
                  });
                },
                pageIndex: pageIndex,
                activeIcon: EneftyIcons.profile_2user_bold,
                inActiveIcon: EneftyIcons.profile_2user_outline,
                index: 0),
            BottomNavMenu(
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                    pageController.jumpToPage(1);
                  });
                },
                pageIndex: pageIndex,
                activeIcon: EneftyIcons.truck_fast_bold,
                inActiveIcon: EneftyIcons.truck_fast_outline,
                index: 1),
            BottomNavMenu(
                onTap: () {
                  setState(() {
                    pageIndex = 2;
                    pageController.jumpToPage(2);
                  });
                },
                pageIndex: pageIndex,
                activeIcon: EneftyIcons.shopping_bag_bold,
                inActiveIcon: EneftyIcons.shopping_bag_outline,
                index: 2),
            BottomNavMenu(
                onTap: () {
                  setState(() {
                    pageIndex = 3;
                    pageController.jumpToPage(3);
                  });
                },
                pageIndex: pageIndex,
                activeIcon: EneftyIcons.user_cirlce_add_bold,
                inActiveIcon: EneftyIcons.user_cirlce_add_outline,
                index: 3),
          ],
        ),
      ),
    );
  }
}
