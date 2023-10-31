import 'package:admin_dashboard/proy/utils/menu_data.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class AdministrationTopMenus extends StatefulWidget {
  const AdministrationTopMenus({super.key});

  @override
  State<AdministrationTopMenus> createState() => _AdministrationTopMenusState();
}

class _AdministrationTopMenusState extends State<AdministrationTopMenus> {
  bool isExpand = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 40),
      width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FxBox.h60,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Text(
                    "Administración",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 30,
                      color: ColorConst.black,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isExpand = !isExpand;
                    });
                  },
                  child: isExpand
                      ? const Icon(Icons.arrow_drop_up)
                      : const Icon(
                          Icons.arrow_drop_down,
                        ),
                ),
              ],
            ),
          ),
          if (isExpand)
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  // spacing: 10,
                  runSpacing: 10,
                  children: MenuData.fetchAdminitrationMenu(context).map((e) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: e.onTap,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 8,
                              height: MediaQuery.of(context).size.width / 8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Icon(
                                  e.icon,
                                  color: ColorConst.primary,
                                  size: MediaQuery.of(context).size.width / 18,
                                ),
                              ),
                            ),
                          ),
                          FxBox.h10,
                          Text(
                            e.title,
                          ),
                        ],
                      ),
                    );
                  }).toList()),
            ),
        ],
      ),
    );
  }
}
