import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/constant/image.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class LockScreenOne extends StatefulWidget {
  const LockScreenOne({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LockScreenOneState();
}

class _LockScreenOneState extends State<LockScreenOne> {
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lottie/connecting-lottie.json",
            width: MediaQuery.of(context).size.width / 1.5),
      ),
      bottomNavigationBar: LinearProgressIndicator(
        color: ColorConst.primary,
      ),
    );
  }

  Widget _cardWidget({
    required Size size,
    required String label,
    required Widget widget,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 180,
        width: _getWidth(),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: isDark
                        ? ColorConst.darkFontColor
                        : ColorConst.lightFontColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                FxBox.h32,
                widget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
