import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

enum ModalType { large, extraLarge, normal }

class FxModal {
  static Future<Object?> showModel({
    required BuildContext context,
    bool barrierDismissible = true,
    ModalType? modelType = ModalType.normal,
    Widget? trailingIcon,
    required String title,
    required Widget content,
    List<Widget>? actions,
  }) async {
    return showGeneralDialog(
      barrierDismissible: barrierDismissible,
      barrierLabel: 'Model',
      context: context,
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          transformHitTests: false,
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        bool isWeb = MediaQuery.of(context).size.width >= 1100;

        double width = 0.0;

        if (modelType == ModalType.extraLarge && isWeb) {
          width = 1138.0;
        } else if (modelType == ModalType.large && isWeb) {
          width = 798.0;
        } else {
          width = 498;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.25),
                    ),
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SelectionArea(
                              child: Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: trailingIcon ?? const SizedBox.shrink(),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 0,
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.25),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 178.0,
                        ),
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                            FxBox.h16,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: content,
                            ),
                            FxBox.h16,
                          ],
                        )),
                      ),
                      actions != null
                          ? Divider(
                              height: 0,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.25),
                            )
                          : const SizedBox.shrink(),
                      actions != null
                          ? Container(
                              padding: const EdgeInsets.all(12),
                              height: 68,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: actions
                                    .map((e) => Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: e,
                                        ))
                                    .toList(),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
