import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/theme.dart';

class UserInfo extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String role;

  const UserInfo({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageWidget = (imageUrl == null)
        ? const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/no-image.jpg'),
          )
        : CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(imageUrl!),
          );

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: isDark ? ColorConst.scaffoldDark : ColorConst.drawerBG,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageWidget,
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                role,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
