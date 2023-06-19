import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class Toast extends StatefulWidget {
  const Toast({Key? key}) : super(key: key);

  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> {
  final List<IconData> _iconList = [
    Icons.home_mini_rounded,
    Icons.check_circle_rounded,
    Icons.error_rounded,
    Icons.warning_rounded,
    Icons.info_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: Responsive.isMobile(context)
          ? [
              _simpleToast(false),
              FxBox.h12,
              _simpleToast(true),
              FxBox.h12,
              _iconToast(),
            ]
          : [
              Row(
                children: [
                  Expanded(child: _simpleToast(false)),
                  FxBox.w12,
                  Expanded(child: _simpleToast(true)),
                ],
              ),
              FxBox.h12,
              Row(
                children: [
                  Expanded(child: _iconToast()),
                  FxBox.w12,
                  Expanded(child: FxBox.shrink),
                ],
              ),
            ],
    );
  }

  Widget _simpleToast(bool background) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                background ? 'Light background toast' : 'Simple toast',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              FxBox.h16,
              _toast(
                context,
                ToastWithColor(
                  message: 'Primary',
                  isLightBackground: background,
                ),
                ToastPosition.top,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithColor.success(
                  message: 'Success',
                  isLightBackground: background,
                ),
                ToastPosition.top,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithColor.error(
                  message: 'Error',
                  isLightBackground: background,
                ),
                ToastPosition.top,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithColor.warning(
                  message: 'Warning',
                  isLightBackground: background,
                ),
                ToastPosition.topLeft,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithColor.info(
                  message: 'Info',
                  isLightBackground: background,
                ),
                ToastPosition.topRight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconToast() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Icon toast',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              FxBox.h16,
              _toast(
                context,
                ToastWithoutColor(
                  message: 'Primary',
                  icon: _iconList[0],
                ),
                ToastPosition.topRight,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithoutColor.success(
                  message: 'Success',
                  icon: _iconList[1],
                ),
                ToastPosition.topRight,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithoutColor.error(
                  message: 'Error',
                  icon: _iconList[2],
                ),
                ToastPosition.topRight,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithoutColor.warning(
                  message: 'Warning',
                  icon: _iconList[3],
                ),
                ToastPosition.topRight,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithoutColor.info(
                  message: 'Info',
                  icon: _iconList[4],
                ),
                ToastPosition.topRight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toast(
      BuildContext context, ToastProvider toast, ToastPosition? position) {
    return InkWell(
      child: FxToast.show(context, toast),
      onTap: () => FxToast.showToast(
        context: context,
        toast: toast,
        position: position,
      ),
    );
  }
}
