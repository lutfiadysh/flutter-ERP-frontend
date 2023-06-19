import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/custom_text.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class AlertEmail extends StatelessWidget {
  const AlertEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width >= 560.0
                    ? 512.0
                    : MediaQuery.of(context).size.width - 48,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: ColorConst.primaryDark,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: ColorConst.black,
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Warning: You\'re approaching your limit. Please upgrade.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: ColorConst.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('You have'),
                            FxBox.w4,
                            const Text(
                              '1 free report',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text('remaining.'),
                          ],
                        ),
                        FxBox.h20,
                        const Text(
                          "Add your credit card now to upgrade your account to a premium plan to ensure you don't miss out on any reports.",
                        ),
                        FxBox.h20,
                        Align(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {},
                            child: const CustomText(
                              title: 'Upgrade My Account',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        FxBox.h20,
                        const Text.rich(
                          TextSpan(
                            text: 'Thanks for choosing',
                            children: <InlineSpan>[
                              TextSpan(
                                text: '  ${Strings.fdash}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ' Admin.'),
                            ],
                          ),
                        ),
                        FxBox.h20,
                        const Text(
                          Strings.fdash,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text('Support Team'),
                        FxBox.h36,
                        const Align(
                          alignment: Alignment.center,
                          child: Text('2022 © ${Strings.fdash}.'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
