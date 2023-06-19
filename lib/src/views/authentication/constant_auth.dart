import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/custom_text.dart';
import 'package:admin_dashboard/src/constant/image.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ConstantAuth {
  static Widget signUp(
      BuildContext context, bool isScreen, String title, String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          title: title,
          textColor:
              isDark ? ColorConst.darkFooterText : ColorConst.lightFontColor,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        GestureDetector(
          onTap: () {
            if (isScreen) {
              context.router.push(const RegisterTwo());
            } else {
              context.router.push(const RegisterOne());
            }
          },
          child: CustomText(
            title: subTitle,
            fontSize: 15,
            textColor: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }

  static Widget footerText() {
    return CustomText(
      title: Strings.footerText,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      textColor: isDark ? ColorConst.darkFooterText : ColorConst.lightFontColor,
    );
  }

  static Widget labelView(String label) {
    return CustomText(
      title: label,
      fontSize: 15,
      fontWeight: FontWeight.w800,
      textColor: isDark ? ColorConst.white : ColorConst.lightFontColor,
    );
  }

  static Widget greenCircle() {
    return Positioned.fill(
      top: 187,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          CircleAvatar(
            radius: 35,
            backgroundColor: ColorConst.primary,
          ),
        ],
      ),
    );
  }

  static Widget whiteCircle() {
    return Positioned.fill(
      top: 185,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor:
                isDark ? ColorConst.darkContainer : ColorConst.white,
          ),
        ],
      ),
    );
  }

  static Widget logoView() {
    return Positioned.fill(
      top: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Images.smLogo,
            height: 60,
            // width: 30.8,
          ),
        ],
      ),
    );
  }

  static Widget headerView(
      String title, String subTitle, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          title: title,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
        FxBox.h6,
        CustomText(
          title: subTitle,
          fontSize: 16,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w400,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
      ],
    );
  }

  static Widget login(
    BuildContext context,
    bool isScreen,
    String title,
    String subTitle,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          title: title,
          textColor:
              isDark ? ColorConst.darkFooterText : ColorConst.lightFontColor,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        GestureDetector(
          onTap: () {
            if (isScreen) {
              context.router.push(const LoginTwo());
            } else {
              context.router.push(LoginOne());
            }
          },
          child: CustomText(
            title: subTitle,
            fontSize: 15,
            textColor: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }

  static Widget homeBackground(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        Images.loginBg,
        fit: BoxFit.cover,
      ),
    );
  }

  static Widget logoWithAppName(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 60,
          child: Image.asset(
            Images.smLogo,
            fit: BoxFit.cover,
          ),
        ),
        FxBox.w4,
        CustomText(
          title: Strings.fdash,
          fontSize: 25,
          fontWeight: FontWeight.w600,
          textColor: color,
        ),
      ],
    );
  }
}
