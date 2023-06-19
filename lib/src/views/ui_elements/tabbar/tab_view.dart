import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/utils/hover.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

enum TabType { defaultTabs, justifyTab, customTab }

class CustomTabView extends StatefulWidget {
  final TabType tabType;
  final List<String>? tabsName;
  final List<Widget> tabsElements;
  final List<IconData>? iconsList;
  const CustomTabView({
    Key? key,
    required this.tabType,
    this.tabsName,
    required this.tabsElements,
    this.iconsList,
  })  : assert(!(tabsName != null && tabsName.length != tabsElements.length),
            'tabsName and TabsElements should be Equal to Each other'),
        assert(
            !(iconsList != null && (iconsList.length != tabsElements.length)),
            'IconsList and TabsElements should be Equal to Each other'),
        assert(!(iconsList != null && tabsName != null),
            'can\'t Provid tabsName and IconsList Both'),
        super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView>
    with TickerProviderStateMixin {
  int selectedTab1 = 0;

  late final TabController _tabController =
      TabController(initialIndex: 0, length: getLength(), vsync: this)
        ..animateTo(0);

  int getLength() {
    if (widget.tabsName != null) {
      return widget.tabsName!.length;
    } else {
      return widget.iconsList!.length;
    }
  }

  double _getWidth(BuildContext ctx) {
    if (Responsive.isTablet(ctx)) {
      return ((MediaQuery.of(ctx).size.width / 1.065) / getLength()) - 40;
    } else if (Responsive.isMobile(ctx)) {
      return MediaQuery.of(ctx).size.width / getLength();
    } else if (MediaQuery.of(ctx).size.width < 1400) {
      return ((MediaQuery.of(ctx).size.width / 1.5) / getLength()) - 60;
    } else {
      return ((MediaQuery.of(ctx).size.width / 2.2) / getLength()) - 60;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: getLength(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Align(
                alignment: widget.tabType == TabType.defaultTabs
                    ? Alignment.centerLeft
                    : Alignment.center,
                child: TabBar(
                  controller: _tabController,
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  indicatorWeight: 4,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor:
                      isDark ? ColorConst.white : ColorConst.black,
                  labelColor: widget.tabType == TabType.justifyTab
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                  indicator: widget.tabType == TabType.justifyTab
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : null,
                  isScrollable: true,
                  physics: const BouncingScrollPhysics(),
                  onTap: (int index) {
                    setState(() {});
                  },
                  tabs: List.generate(
                    getLength(),
                    (index) => SizedBox(
                      width: widget.tabType == TabType.defaultTabs
                          ? null
                          : _getWidth(context),
                      child: FxHover(
                        builder: (isHover) {
                          return Tab(
                            child: widget.tabsName == null
                                ? null
                                : Text(
                                    widget.tabsName![index],
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SelectionArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: IntrinsicHeight(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  dragStartBehavior: DragStartBehavior.down,
                  children: List.generate(
                    widget.tabsElements.length,
                    (index) => widget.tabsElements[index],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
