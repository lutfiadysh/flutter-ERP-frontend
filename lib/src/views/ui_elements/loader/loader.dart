import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class Loaders extends StatefulWidget {
  const Loaders({Key? key}) : super(key: key);

  @override
  State<Loaders> createState() => _LoadersState();
}

class _LoadersState extends State<Loaders> {
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
    return Center(
      child: Wrap(
        children: [
          FxBox.h20,
          _cardWidget(
            size: size,
            label: 'Basic Loader',
            widget: const FxLoader.basicLoader(
              duration: Duration(milliseconds: 900),
              color: ColorConst.primary,
              size: 40,
            ),
          ),
          FxBox.h20,
          _cardWidget(
            size: size,
            label: 'Spining circle Loader',
            widget: const FxLoader.spinningLinesLoader(
              duration: Duration(milliseconds: 3000),
              color: ColorConst.chartColorBlue,
              itemCount: 3,
              size: 50,
              lineWidth: 2,
            ),
          ),
          FxBox.h20,
          _cardWidget(
            size: size,
            label: 'Wave Loader',
            widget: FxLoader.waveLoader(
              color: ColorConst.info,
              duration: const Duration(milliseconds: 1200),
              itemCount: 5,
              size: 40,
              wavetype: WaveType.start,
            ),
          ),
          FxBox.h20,
          _cardWidget(
            size: size,
            label: 'Circle Loader',
            widget: FxLoader.circleLoader(
              color: ColorConst.warning,
              duration: const Duration(milliseconds: 1200),
              size: 60,
            ),
          ),
          FxBox.h20,
          _cardWidget(
            size: size,
            label: 'Cube Grid Loader',
            widget: FxLoader.cubeGridLoader(
              color: ColorConst.error,
              duration: const Duration(milliseconds: 1200),
              size: 50,
            ),
          ),
          FxBox.h20,
          _cardWidget(
            size: size,
            label: 'Double Bounce Loader',
            widget: const FxLoader.doubleBounceLoader(
              color: ColorConst.primary,
              duration: Duration(milliseconds: 2000),
              size: 50,
            ),
          ),
          FxBox.h20,
          _cardWidget(
            size: size,
            label: 'Fading circle Loader',
            widget: const FxLoader.fadingCircleLoader(
              color: ColorConst.chartColorBlue,
              duration: Duration(milliseconds: 1200),
              size: 50,
            ),
          ),
          FxBox.h20,
          _cardWidget(
            size: size,
            label: 'Pulse circle Loader',
            widget: FxLoader.pulseCircleLoader(
              color: ColorConst.info,
              duration: const Duration(milliseconds: 1200),
              size: 50,
            ),
          ),
          FxBox.h20,
          _cardWidget(
            size: size,
            label: 'Rotating circle Loader',
            widget: FxLoader.rotatingCircleLoader(
              color: ColorConst.warning,
              duration: const Duration(milliseconds: 1200),
              size: 50,
            ),
          ),
          FxBox.h20,
          _cardWidget(
            size: size,
            label: 'Rotating Plain Square Loader',
            widget: FxLoader.rotatingPlainLoader(
              color: ColorConst.error,
              duration: const Duration(milliseconds: 1500),
              size: 50,
            ),
          ),
        ],
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
