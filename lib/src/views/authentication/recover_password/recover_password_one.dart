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
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

class RecoverPasswordOne extends StatefulWidget {
  const RecoverPasswordOne({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecoverPasswordOneState();
}

class _RecoverPasswordOneState extends State<RecoverPasswordOne> {
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
                  SingleChildScrollView(
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
                              color:
                                  isDark ? ColorConst.black : ColorConst.white,
                              border: Border.all(
                                color: isDark
                                    ? ColorConst.black
                                    : ColorConst.white,
                              ),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: _logoView(),
                                ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _headerView(String title) {
  //   return Container(
  //     width: 400,
  //     margin: const EdgeInsets.only(top: 70),
  //     padding: const EdgeInsets.only(left: 12.0, right: 12.0),
  //     decoration: const BoxDecoration(
  //       color: ColorConst.primary,
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(4.0),
  //         topRight: Radius.circular(4.0),
  //       ),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsets.all(40.0),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           CustomText(
  //             title: title,
  //             fontSize: 19,
  //             fontWeight: FontWeight.w700,
  //             textColor: ColorConst.white,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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

  Widget _logoView() {
    return SvgPicture.asset(IconlyBroken.adminKit);
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
