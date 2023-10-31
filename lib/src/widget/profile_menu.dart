import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String title;
  final Function() onTap;
  final IconData? iconData;
  const ProfileMenu(
      {super.key, required this.title, required this.onTap, this.iconData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: Colors.black.withOpacity(.12),
              blurRadius: 12,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              iconData != null ? iconData! : Icons.power_settings_new_rounded,
              color: Colors.black,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
