import 'package:admin_dashboard/src/constant/custom_text.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class BasicEmail extends StatelessWidget {
  const BasicEmail({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.indigo, width: 3.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Please confirm your email address by clicking the link below.",
                    softWrap: true,
                  ),
                  FxBox.h20,
                  const Text(
                    "We may need to send you critical information about our service and it is important that we have an accurate email address.",
                    softWrap: true,
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
                        title: 'Confirm Email Address',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  FxBox.h20,
                  const Text(
                    Strings.fdash,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text("Support Team"),
                  FxBox.h36,
                  const Align(
                    alignment: Alignment.center,
                    child: Text("2022 © ${Strings.fdash}."),
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
