import 'package:admin_dashboard/proy/providers/auth_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/image.dart';
import 'package:admin_dashboard/src/views/user/edit_profile_page.dart';
import 'package:admin_dashboard/src/widget/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<AuthProvider>(context);
    final user = userFormProvider.user!;
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 40, 0, 0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  width: MediaQuery.of(context).size.width / 8,
                  height: MediaQuery.of(context).size.height / 8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 2),
                        color: Colors.black.withOpacity(.12),
                        blurRadius: 16,
                      )
                    ],
                    image: user.img != null
                        ? DecorationImage(
                            image: NetworkImage(user.img.toString()))
                        : const DecorationImage(
                            image: AssetImage(
                            Images.profileImage,
                          )),
                    shape: BoxShape.circle,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.nombre,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      user.rol,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ProfileMenu(
            title: 'Edit Profile',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()));
            },
            iconData: Icons.arrow_forward_ios,
          ),
          // ProfileMenu(
          //   title: 'App Setting',
          //   onTap: () {},
          //   iconData: Icons.arrow_forward_ios,
          // ),
          ProfileMenu(
            title: 'Logout',
            onTap: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
