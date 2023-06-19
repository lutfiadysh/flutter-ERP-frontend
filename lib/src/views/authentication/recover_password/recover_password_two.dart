import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/custom_text.dart';
import 'package:admin_dashboard/src/constant/icons.dart';
import 'package:admin_dashboard/src/constant/image.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/widget/custom_text_field.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/authentication/constant_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterx/flutterx.dart';

class RecoverPasswordTwo extends StatefulWidget {
  const RecoverPasswordTwo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecoverPasswordTwoState();
}

class _RecoverPasswordTwoState extends State<RecoverPasswordTwo> {
  final TextEditingController _emailController = TextEditingController();

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
                                    CustomText(
                                      title: Strings.resetPassword,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      textColor: isDark
                                          ? ColorConst.white
                                          : ColorConst.black,
                                    ),
                                    _bottomView(),
                                  ],
                                ),
                              ),
                            ),
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
      mainAxisSize: MainAxisSize.min,
      children: [
        FxBox.h16,
        _emailInstruction(),
        FxBox.h16,
        ConstantAuth.labelView(Strings.emailstr),
        FxBox.h8,
        _emailTextBoxWidget(),
        FxBox.h16,
        Align(
          alignment: Alignment.centerRight,
          child: _resetButton(),
        ),
        FxBox.h36,
        _serviceText()
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

  Widget _emailInstruction() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 65,
      margin: const EdgeInsets.only(top: 15, bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorConst.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(
          color: ColorConst.borderColor,
          width: 1,
        ),
      ),
      child: CustomText(
        title: Strings.emailInstructions,
        fontSize: 15,
        fontWeight: FontWeight.w700,
        textColor: ColorConst.darkGreen2,
      ),
    );
  }

  Widget _emailTextBoxWidget() {
    return CustomTextField(
      hintText: Strings.enterEmail,
      onChanged: (String value) {},
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.done,
      controller: _emailController,
    );
  }

  Widget _resetButton() {
    return FxButton(
      onPressed: () {},
      text: Strings.reset,
      borderRadius: 8.0,
      height: 40,
      minWidth: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
