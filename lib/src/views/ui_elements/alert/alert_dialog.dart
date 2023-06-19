import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class AlertDialogBox extends StatefulWidget {
  const AlertDialogBox({Key? key}) : super(key: key);

  @override
  State<AlertDialogBox> createState() => _AlertDialogBoxState();
}

class _AlertDialogBoxState extends State<AlertDialogBox> {
  double _getWidth() {
    if (MediaQuery.of(context).size.width <= 550) {
      return MediaQuery.of(context).size.width / 2 - 40;
    } else if (MediaQuery.of(context).size.width <= 750) {
      return (MediaQuery.of(context).size.width / 2) - 50;
    } else if (Responsive.isWeb(context)) {
      return ((MediaQuery.of(context).size.width - 240) / 4) - 36;
    } else {
      return (MediaQuery.of(context).size.width / 3) - 36;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0,
      runSpacing: 56,
      children: [
        _alertButton(
          title: Strings.simpleAlert,
          text: Strings.simpleAlert,
          buttons: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.ok,
            ),
          ],
        ),
        FxBox.w16,
        _alertButton(
          title: Strings.iconAlert,
          text: Strings.iconAlert,
          icon: const Icon(Icons.error_rounded, size: 30.0),
          buttons: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.ok,
            ),
          ],
        ),
        FxBox.w16,
        _alertButton(
          title: Strings.alertWithTwoButton,
          text: Strings.alertWithTwoButton,
          buttons: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.ok,
            ),
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.cancle,
              buttonType: ButtonType.secondary,
            ),
          ],
        ),
        FxBox.w16,
        _alertButton(
          title: 'Icon Alert With Two Button',
          text: 'Alert With Two Button',
          icon: Icon(
            Icons.check_circle_outline_rounded,
            size: 30.0,
            color: ColorConst.success,
          ),
          buttons: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.confirm,
              buttonType: ButtonType.success,
            ),
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.cancle,
              buttonType: ButtonType.secondary,
            ),
          ],
        ),
        FxBox.w16,
        _alertButton(
          title: 'Gif Alert',
          text: 'Git alert',
          icon: Image.asset('assets/rocket.gif', height: 40, width: 40),
          buttons: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.ok,
            ),
          ],
        ),
        FxBox.w16,
        _alertButton(
          title: 'Alert With Textfield',
          text: 'alert with textfield',
          content: const SizedBox(
            width: 300,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ),
          icon: Image.asset('assets/rocket.gif', height: 40, width: 40),
          buttons: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.ok,
            ),
          ],
        ),
      ],
    );
  }

  Widget _alertButton({
    required String title,
    required String text,
    Widget? content,
    List<Widget>? buttons,
    Widget? icon,
  }) {
    return SizedBox(
      height: 180,
      width: _getWidth(),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
            FxBox.h16,
            FxButton(
              text: Strings.clickMe,
              onPressed: () {
                FxAlert.showAlert(
                  icon: icon,
                  context: context,
                  title: text,
                  content: content ??
                      Text('This is ${title.toLowerCase()} dialog box.'),
                  actions: buttons!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
