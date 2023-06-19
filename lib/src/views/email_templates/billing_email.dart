import 'package:admin_dashboard/src/constant/custom_text.dart';
import 'package:admin_dashboard/src/constant/icons.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterx/flutterx.dart';

class BillingEmail extends StatelessWidget {
  const BillingEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Card(
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width >= 560.0
                    ? 512.0
                    : MediaQuery.of(context).size.width - 48,
              ),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: BlocBuilder<ThemeModeBloc, ThemeModeState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxBox.h40,
                      Center(
                        child: SvgPicture.asset(
                          IconlyBroken.adminKitText,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                      FxBox.h60,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Company Name",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Invoice #6521"),
                              Text("November 01 2022"),
                            ],
                          ),
                          const Expanded(
                            child: CustomText(
                                textAlign: TextAlign.right,
                                title:
                                    "${Strings.fdash} Inc.\n 2896 Howell Rd, \nRussellville, AR, 72823"),
                          ),
                        ],
                      ),
                      FxBox.h40,
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: 3,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            children: const [
                              Text("BS-200 (1 Pc)"),
                              Spacer(),
                              Text("\$10.99"),
                              Divider(
                                color: Colors.deepPurple,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(height: 8.0);
                        },
                      ),
                      FxBox.h8,
                      Divider(
                        color: isDark ? Colors.white : Colors.black,
                        height: 8.0,
                        thickness: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Total	",
                            style: TextStyle(
                                color: isDark ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$670.99",
                            style: TextStyle(
                                color: isDark ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Divider(
                        color: isDark ? Colors.white : Colors.black,
                        height: 8.0,
                        thickness: 2.0,
                      ),
                      FxBox.h60,
                      const Align(
                        alignment: Alignment.center,
                        child: Text("2022 © ${Strings.fdash}."),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
