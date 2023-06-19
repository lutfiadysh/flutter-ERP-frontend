import 'package:admin_dashboard/src/constant/icons.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/widget/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class Modal extends StatefulWidget {
  const Modal({Key? key}) : super(key: key);

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
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
        _modelButton(
          title: 'Simple modal',
          content: const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
          ),
        ),
        FxBox.w16,
        _modelButton(
          title: 'Modal with button',
          content: const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
          ),
          actions: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.close,
              buttonType: ButtonType.secondary,
            ),
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.saveChange,
            ),
          ],
        ),
        FxBox.w16,
        _modelButton(
          title: 'Large modal',
          modalType: ModalType.large,
          content: const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
          ),
          actions: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.close,
              buttonType: ButtonType.secondary,
            ),
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.saveChange,
            ),
          ],
        ),
        FxBox.w16,
        _modelButton(
          title: 'Extra Large modal',
          modalType: ModalType.extraLarge,
          content: const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
          ),
          actions: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.close,
              buttonType: ButtonType.secondary,
            ),
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.saveChange,
            ),
          ],
        ),
        FxBox.w16,
        _modelButton(
          title: 'Scrollable modal',
          content: const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
          ),
          actions: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.close,
              buttonType: ButtonType.secondary,
            ),
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.saveChange,
            ),
          ],
        ),
      ],
    );
  }

  Widget _modelButton(
      {required String title,
      required Widget content,
      List<Widget>? actions,
      ModalType? modalType = ModalType.normal}) {
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
                FxModal.showModel(
                  context: context,
                  title: title,
                  content: SelectionArea(child: content),
                  trailingIcon: const SvgIcon(icon: IconlyBroken.closeSquare),
                  actions: actions,
                  modelType: modalType,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
