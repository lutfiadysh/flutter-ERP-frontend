import 'package:admin_dashboard/src/constant/color.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class BottomNavMenu extends StatelessWidget {
  final int pageIndex;
  final IconData activeIcon;
  final IconData inActiveIcon;
  final int index;
  final Function() onTap;
  const BottomNavMenu({
    super.key,
    required this.pageIndex,
    required this.activeIcon,
    required this.inActiveIcon,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        pageIndex == index ? activeIcon : inActiveIcon,
        fill: 0,
        color:
            pageIndex == index ? ColorConst.chartColorYellow : ColorConst.white,
      ),
    );
  }
}
