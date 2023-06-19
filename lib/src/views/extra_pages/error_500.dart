import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

class Error500 extends StatefulWidget {
  const Error500({Key? key}) : super(key: key);

  @override
  State<Error500> createState() => _Error500State();
}

class _Error500State extends State<Error500> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width < 1200
                ? Responsive.isTablet(context)
                    ? 60
                    : Responsive.isMobile(context)
                        ? 48
                        : 96
                : 228,
          ),
          alignment: Alignment.center,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Responsive.isWeb(context)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "500",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 80,
                                    ),
                                  ),
                                  Text(
                                    "Internal Server Error",
                                    style: TextStyle(
                                      color: isDark
                                          ? ColorConst.darkFontColor
                                          : ColorConst.textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21,
                                    ),
                                  ),
                                  FxBox.h24,
                                  const Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                  ),
                                  FxBox.h48,
                                  FxButton(
                                    borderRadius: 15,
                                    text: "Back to Dashboard",
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.home, size: 15),
                                  )
                                ],
                              ),
                            ),
                            FxBox.w(84),
                            SizedBox(
                              height: 500,
                              width: 600,
                              child: SvgPicture.asset(
                                  'assets/images/error-500.svg'),
                              // child: Image.asset("assets/images/image.png"),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "500",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 80,
                              ),
                            ),
                            Text(
                              "Internal Server Error",
                              style: TextStyle(
                                color: isDark
                                    ? ColorConst.darkFontColor
                                    : ColorConst.textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 21,
                              ),
                            ),
                            FxBox.h24,
                            const Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            ),
                            FxBox.h48,
                            FxButton(
                              borderRadius: 15,
                              text: " Back to Dashboard",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.home, size: 15),
                            ),
                            FxBox.h48,
                            SizedBox(
                              height: 300,
                              width: 400,
                              child: SvgPicture.asset(
                                  'assets/images/error-500.svg'),
                              // child: Image.asset("assets/images/image.png"),
                            ),
                          ],
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
