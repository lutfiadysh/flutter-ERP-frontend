import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  final List<String> _buttonText = [
    'Primary',
    'Secondary',
    'Success',
    'Info',
    'Warning',
    'Error'
  ];

  final Map<IconData, dynamic> _simpleButtonData = {
    Icons.home_outlined: null,
    Icons.house_outlined: ButtonType.secondary,
    Icons.check_circle_outline_rounded: ButtonType.success,
    Icons.info_outline_rounded: ButtonType.info,
    Icons.warning_amber_rounded: ButtonType.warning,
    Icons.error_outline_rounded: ButtonType.error,
  };

  final Map<IconData, dynamic> _outlineButtonData = {
    Icons.home: null,
    Icons.house: ButtonType.secondary,
    Icons.check_circle_rounded: ButtonType.success,
    Icons.info_rounded: ButtonType.info,
    Icons.warning_rounded: ButtonType.warning,
    Icons.error_rounded: ButtonType.error,
  };

  List<Widget> _buttonList = [];

  @override
  void initState() {
    super.initState();
    _buttonList = [
      _simpleButton(),
      _outlinedButton(),
      _simpleTextIconButton(),
      _outlineTextIconButton(),
      _simpleIconButton(),
      _outlineIconButton(),
      _socialButton(context),
      _outlinedSocialButton(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Responsive.isWeb(context)
        ? Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: _simpleButton(),
                      ),
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: _outlinedButton(),
                      ),
                    ),
                  ),
                ],
              ),
              FxBox.h12,
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: _simpleTextIconButton(),
                      ),
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: _outlineTextIconButton(),
                      ),
                    ),
                  ),
                ],
              ),
              FxBox.h12,
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: _simpleIconButton(),
                      ),
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: _outlineIconButton(),
                      ),
                    ),
                  ),
                ],
              ),
              FxBox.h12,
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: _socialButton(context),
                      ),
                    ),
                  ),
                  FxBox.w12,
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: _outlinedSocialButton(context),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: _buttonList[index],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => FxBox.h12,
                itemCount: _buttonList.length,
              ),
            ],
          );
  }

  Widget _simpleButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Simple buttons',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        FxBox.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(_buttonText.length, (index) {
            return FxButton(
              onPressed: () {},
              text: _buttonText[index],
              buttonType: _simpleButtonData.values.elementAt(index),
            );
          }),
        )
      ],
    );
  }

  Widget _outlinedButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Outline buttons',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        FxBox.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(_buttonText.length, (index) {
            return FxButton(
              onPressed: () {},
              text: _buttonText[index],
              buttonType: _simpleButtonData.values.elementAt(index),
              isOutlineButton: true,
            );
          }),
        )
      ],
    );
  }

  Widget _simpleTextIconButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Simple with icon buttons',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        FxBox.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(_buttonText.length, (index) {
            return FxButton(
              onPressed: () {},
              text: _buttonText[index],
              buttonType: _simpleButtonData.values.elementAt(index),
              icon: Icon(_simpleButtonData.keys.elementAt(index)),
            );
          }),
        )
      ],
    );
  }

  Widget _outlineTextIconButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Outline with icon buttons',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        FxBox.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(_buttonText.length, (index) {
            return FxButton(
              onPressed: () {},
              text: _buttonText[index],
              buttonType: _outlineButtonData.values.elementAt(index),
              icon: Icon(_outlineButtonData.keys.elementAt(index)),
              isOutlineButton: true,
            );
          }),
        )
      ],
    );
  }

  Widget _simpleIconButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Simple icon buttons',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        FxBox.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(_buttonText.length, (index) {
            return FxButton(
              onPressed: () {},
              buttonType: _simpleButtonData.values.elementAt(index),
              icon: Icon(_simpleButtonData.keys.elementAt(index)),
            );
          }),
        )
      ],
    );
  }

  Widget _outlineIconButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Outline icon buttons',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        FxBox.h16,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(_buttonText.length, (index) {
            return FxButton(
              onPressed: () {},
              buttonType: _outlineButtonData.values.elementAt(index),
              icon: Icon(_outlineButtonData.keys.elementAt(index)),
              isOutlineButton: true,
            );
          }),
        )
      ],
    );
  }

  Widget _socialButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Social buttons',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        FxBox.h16,
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            SocialButton.apple(
              onPressed: () {},
            ),
            SocialButton.facebook(
              onPressed: () {},
            ),
            SocialButton.whatsApp(
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }

  Widget _outlinedSocialButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Outlined social buttons',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        FxBox.h16,
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            SocialButton.apple(
              isOutlineButton: true,
              onPressed: () {},
            ),
            SocialButton.facebook(
              isOutlineButton: true,
              onPressed: () {},
            ),
            SocialButton.whatsApp(
              isOutlineButton: true,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
