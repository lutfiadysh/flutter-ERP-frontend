import 'package:admin_dashboard/proy/providers/users_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/image.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/users/create_user_page.dart';
import 'package:admin_dashboard/src/views/users/usersview_test.dart';
import 'package:enefty_icons/enefty_icons.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();

    Provider.of<UsersProvider>(context, listen: false).getPaginatedUsers();
  }

  @override
  Widget build(BuildContext context) {
    final usuarios = Provider.of<UsersProvider>(context).users;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Colors.black,
            ),
          ),
          centerTitle: false,
          titleSpacing: 0,
          title: const Text(
            Strings.users,
            style: TextStyle(
              fontSize: 16,
              color: ColorConst.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateUserPage()));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                child: const Icon(
                  EneftyIcons.add_bold,
                ),
              ),
            ),
          ],
        ),
        body: usuarios.isNotEmpty
            ? SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: usuarios.map((e) {
                        return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            width: MediaQuery.of(context).size.width - 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      width:
                                          MediaQuery.of(context).size.width / 8,
                                      height:
                                          MediaQuery.of(context).size.width / 8,
                                      decoration: BoxDecoration(
                                        image: e.img != null
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                  e.img.toString(),
                                                ),
                                                fit: BoxFit.cover,
                                              )
                                            : const DecorationImage(
                                                image: AssetImage(
                                                    Images.profileImage)),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.nombre,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          e.rol,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 10,
                                  height:
                                      MediaQuery.of(context).size.width / 10,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: e.estado
                                        ? ColorConst.darkGreen.withOpacity(.12)
                                        : ColorConst.error.withOpacity(.12),
                                  ),
                                  child: Center(
                                      child: Icon(
                                    e.estado
                                        ? EneftyIcons.verify_bold
                                        : Icons.error,
                                    color: e.estado
                                        ? ColorConst.darkGreen
                                        : ColorConst.error,
                                  )),
                                ),
                              ],
                            ));
                      }).toList(),
                    )),
              )
            : ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      width: MediaQuery.of(context).size.width - 32,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
