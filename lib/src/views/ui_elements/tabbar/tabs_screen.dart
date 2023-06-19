import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/views/categories/table_categories.dart';
import 'package:admin_dashboard/src/views/ui_elements/tabbar/tab_view.dart';
import 'package:flutterx/flutterx.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  final labelList = const ['Movimientos', 'Entradas', 'Salidas'];
  final List<Widget> labelItemsList = const [
    TableCategories(),
    Text('Data3'),
  ];

  List<IconData> iconsList = const [
    Icons.home,
    Icons.person,
    Icons.email,
    Icons.settings,
    Icons.expand,
  ];

  late final TabController _controller;
  late TextTheme textTheme;

  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive.isWeb(context) ? _webView(ctx: context) : _mobileView();
  }

  Widget _mobileView() {
    return Center(
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _defaultTabs('Movimientos', TabType.customTab),
          ],
        ),
      ),
    );
  }

  Widget _defaultTabs(String title, TabType type) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FxBox.h10,
          CustomTabView(
            tabType: type,
            tabsName: labelList,
            tabsElements: labelItemsList,
          ),
        ],
      ),
    );
  }

  Widget _webView({required BuildContext ctx}) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: _defaultTabs('Custom Tabs', TabType.customTab)),
              FxBox.w20,
              Expanded(child: FxBox.shrink)
            ],
          ),
        ],
      ),
    );
  }
}
