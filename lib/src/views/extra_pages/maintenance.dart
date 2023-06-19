import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/custom_text.dart';
import 'package:admin_dashboard/src/constant/icons.dart';
import 'package:admin_dashboard/src/constant/image.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

class Maintenance extends StatefulWidget {
  const Maintenance({Key? key}) : super(key: key);

  @override
  State<Maintenance> createState() => _MaintenanceState();
}

class _MaintenanceState extends State<Maintenance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Center(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Responsive.isMobile(context)
                        ? Column(
                            children: [
                              SvgPicture.asset(
                                IconlyBroken.adminKitText,
                              ),
                              FxBox.h28,
                              Text(
                                "Site is Under Maintenance",
                                style: TextStyle(
                                  color: isDark
                                      ? ColorConst.darkFontColor
                                      : ColorConst.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              FxBox.h8,
                              Text(
                                "Please check back in sometime.",
                                style: TextStyle(
                                  color: isDark
                                      ? ColorConst.darkFontColor
                                      : ColorConst.textColor,
                                ),
                              ),
                              FxBox.h32,
                              const CustomText(
                                textAlign: TextAlign.center,
                                title:
                                    'Our website is under construction, we are working \nvery hard to give you the best experience with this one.',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              FxBox.h28,
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 1,
                                child: Image.asset(
                                  Images.maintenance,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          )
                        //Column(children: _list())
                        : Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      IconlyBroken.adminKitText,
                                    ),
                                    FxBox.h28,
                                    Text(
                                      "Site is Under Maintenance",
                                      style: TextStyle(
                                        color: isDark
                                            ? ColorConst.darkFontColor
                                            : ColorConst.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                      ),
                                    ),
                                    FxBox.h8,
                                    Text(
                                      "Please check back in sometime.",
                                      style: TextStyle(
                                        color: isDark
                                            ? ColorConst.darkFontColor
                                            : ColorConst.textColor,
                                      ),
                                    ),
                                    FxBox.h32,
                                    const CustomText(
                                      textAlign: TextAlign.center,
                                      title:
                                          'Our website is under construction, we are working \nvery hard to give you the best experience with this one.',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Image.asset(
                                    Images.maintenance,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          )
                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: _list(),
                    //   )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // List<Widget> _list() {
  //   return [
  //     _container(
  //       Icons.flight_takeoff_rounded,
  //       "WHY IS THE SITE DOWN?",
  //       "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration.",
  //       "",
  //     ),
  //     _sizedBox(),
  //     _container(
  //       Icons.access_time_filled_rounded,
  //       "WHAT IS THE DOWNTIME?",
  //       "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical.",
  //       "",
  //     ),
  //     _sizedBox(),
  //     _container(
  //       Icons.email_rounded,
  //       "DO YOU NEED SUPPORT?",
  //       "If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embar..",
  //       "no-reply@domain.com",
  //     ),
  //   ];
  // }

  // Widget _sizedBox() {
  //   return Responsive.isMobile(context) ? FxBox.h20 : FxBox.w8;
  // }

  // Widget _container(
  //   IconData? icon,
  //   String smallText,
  //   String paragraph,
  //   String email,
  // ) {
  //   TextStyle style = TextStyle(
  //     color: isDark ? ColorConst.darkFontColor : ColorConst.textColor,
  //     fontWeight: FontWeight.bold,
  //     fontSize: 16,
  //   );
  //   return SizedBox(
  //     width: Responsive.isMobile(context)
  //         ? MediaQuery.of(context).size.width * .65
  //         : MediaQuery.of(context).size.width * .19,
  //     child: Card(
  //       child: Padding(
  //         padding: const EdgeInsets.all(25),
  //         child: Column(
  //           children: [
  //             Icon(icon),
  //             FxBox.h16,
  //             Text(smallText, style: style),
  //             FxBox.h16,
  //             Text(
  //               paragraph,
  //               style: TextStyle(
  //                 color:
  //                     isDark ? ColorConst.darkFontColor : ColorConst.textColor,
  //               ),
  //             ),
  //             email.isNotEmpty
  //                 ? GestureDetector(
  //                     onTap: () async {
  //                       String email = 'no-reply@domain.com';
  //                       String subject = 'This is a email';
  //                       String body = 'Hello Mr./Mrs.';
  //                       String emailUrl =
  //                           "mailto:$email?subject=$subject&body=$body";
  //                       if (await canLaunchUrl(Uri.parse(emailUrl))) {
  //                         await launchUrl(Uri.parse(emailUrl));
  //                       } else {
  //                         throw "Error occured sending an email";
  //                       }
  //                     },
  //                     child: Align(
  //                       alignment: Alignment.topLeft,
  //                       child: Text(
  //                         email,
  //                         style: const TextStyle(
  //                           color: ColorConst.primary,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ),
  //                   )
  //                 : const SizedBox.shrink(),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
