import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/custom_text.dart';
import 'package:admin_dashboard/src/constant/icons.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/widget/custom_text_field.dart';
import 'package:admin_dashboard/src/constant/image.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/authentication/constant_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

class LockScreenTwo extends StatefulWidget {
  const LockScreenTwo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LockScreenTwoState();
}

class _LockScreenTwoState extends State<LockScreenTwo> {
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SelectionArea(
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    Images.authBG,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            FxBox.h20,
                            Center(
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 460,
                                ),
                                padding: Responsive.isMobile(context)
                                    ? const EdgeInsets.all(32)
                                    : const EdgeInsets.all(40),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? ColorConst.black
                                      : ColorConst.white,
                                  border: Border.all(
                                    color: isDark
                                        ? ColorConst.black
                                        : ColorConst.white,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  children: [
                                    _logoView(),
                                    FxBox.h16,
                                    ConstantAuth.headerView(Strings.locked,
                                        Strings.lockedDescription, context),
                                    _bottomView(),
                                  ],
                                ),
                              ),
                            ),
                            FxBox.h20,
                          ],
                        ),
                      ),
                      Responsive.isWeb(context)
                          ? Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    constraints:
                                        const BoxConstraints(maxHeight: 400),
                                    child: SvgPicture.asset(
                                      IconlyBroken.adminKitText,
                                    ),
                                  ),
                                  FxBox.h16,
                                  Center(
                                    child: CustomText(
                                      title: Strings.loginHeaderText,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      textColor: isDark
                                          ? ColorConst.darkFooterText
                                          : ColorConst.lightFontColor,
                                    ),
                                  ),
                                  FxBox.h12,
                                  ConstantAuth.footerText(),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoView() {
    return SvgPicture.asset(IconlyBroken.adminKit);
  }

  Widget _bottomView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxBox.h28,
        _profileImageView(),
        FxBox.h8,
        ConstantAuth.labelView(Strings.password),
        FxBox.h8,
        _passwordTextBoxWidget(),
        FxBox.h20,
        _unLockButton(),
        FxBox.h20,
        _serviceText(),
        FxBox.h4,
      ],
    );
  }

  Widget _serviceText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: CustomText(
            title: Strings.privacy,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            textColor: isDark ? ColorConst.white : ColorConst.black,
          ),
        ),
        Expanded(
          child: CustomText(
            title: Strings.terms,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            textColor: isDark ? ColorConst.white : ColorConst.black,
          ),
        ),
        Expanded(
          child: CustomText(
            title: Strings.sarvadhi2022,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            textColor: isDark ? ColorConst.white : ColorConst.black,
          ),
        ),
      ],
    );
  }

  // Widget _mainView() {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 50),
  //     padding: const EdgeInsets.symmetric(horizontal: 36.0),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         ConstantAuth.logoWithAppName(
  //           isDark ? ColorConst.white : ColorConst.black,
  //         ),
  //         FxBox.h28,
  //         Center(
  //           child: CustomText(
  //             title: Strings.locked,
  //             fontSize: 19,
  //             fontWeight: FontWeight.w800,
  //             textColor: isDark
  //                 ? ColorConst.darkFooterText
  //                 : ColorConst.lightFontColor,
  //           ),
  //         ),
  //         FxBox.h6,
  //         Center(
  //           child: CustomText(
  //             title: Strings.lockedDescription,
  //             fontSize: 15,
  //             fontWeight: FontWeight.w700,
  //             textColor: isDark
  //                 ? ColorConst.darkFooterText
  //                 : ColorConst.lightFontColor,
  //           ),
  //         ),
  //         FxBox.h28,
  //         _profileImageView(),
  //         FxBox.h8,
  //         ConstantAuth.labelView(Strings.password),
  //         FxBox.h8,
  //         _passwordTextBoxWidget(),
  //         FxBox.h16,
  //         Align(alignment: Alignment.topRight, child: _unLockButton()),
  //         FxBox.h4,
  //         FxBox.h60,
  //         ConstantAuth.login(
  //           context,
  //           true,
  //           Strings.notYouReturn,
  //           Strings.signIn,
  //         ),
  //         FxBox.h16,
  //         ConstantAuth.footerText(),
  //       ],
  //     ),
  //   );
  // }

  Widget _profileImageView() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(Images.profileImage),
              ),
              border: Border.all(
                width: 5.0,
                color: ColorConst.appbarLightBG,
              ),
            ),
          ),
          FxBox.h16,
          CustomText(
            title: 'Jane Doe',
            fontSize: 17,
            fontWeight: FontWeight.w800,
            textColor:
                isDark ? ColorConst.white : ColorConst.lightFontColor,
          )
        ],
      ),
    );
  }

  Widget _passwordTextBoxWidget() {
    return CustomTextField(
      obsecureText: true,
      hintText: Strings.enterPassword,
      onChanged: (String value) {},
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.done,
      controller: _passwordController,
    );
  }

  Widget _unLockButton() {
    return FxButton(
      onPressed: () {},
      text: Strings.unLock,
      borderRadius: 8.0,
      height: 40,
      minWidth: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
