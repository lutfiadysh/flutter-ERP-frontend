import 'package:admin_dashboard/proy/providers/auth_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/icons.dart';
import 'package:admin_dashboard/src/constant/image.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:admin_dashboard/src/routes/routes.gr.dart' as item;
import 'package:admin_dashboard/src/utils/hive/hive.dart';
import 'package:admin_dashboard/src/utils/hover.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/utils/routes.dart';
import 'package:admin_dashboard/src/utils/text_utils.dart';
import 'package:admin_dashboard/src/views/user_info.dart';
import 'package:admin_dashboard/src/widget/end_drawer.dart';
import 'package:admin_dashboard/src/widget/expantion_tile.dart';
import 'package:admin_dashboard/src/widget/svg_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldDrawerKey =
      GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();

  ValueNotifier<bool> isOpen = ValueNotifier(true);

  Map<String, IconData> mainData = {
    Strings.dashboard: Icons.dashboard,
    Strings.users: Icons.people_alt,
    Strings.categories: Icons.category_sharp,
    Strings.products: Icons.auto_awesome_mosaic,
  };

  Map<String, IconData> componentData = {
    Strings.managment: Icons.manage_accounts,
    Strings.inventory: Icons.inventory_2_rounded,
    Strings.sales: Icons.sell_rounded,
  };

  Map<String, IconData> extrasData = {
    Strings.authentication: Icons.archive,
    Strings.emailTemplates: Icons.email,
    Strings.extraPages: Icons.pages,
  };

  List<List<String>> componentsExpandList = [
    [
      Strings.dashboard,
      Strings.users,
      Strings.categories,
      Strings.products,
    ],
    [
      Strings.movements,
      Strings.transfers,
      Strings.stocks,
      Strings.verifications,
    ],
    [
      Strings.listings,
      Strings.salesView,
    ],
  ];

  final List<String> _items = [
    Strings.profile,
    Strings.settings,
    Strings.lockScreen,
  ];

  final List<String> _notificationTitle = [
    'Your order is shipped',
    'your accound have verified',
    'New Notification arrived',
  ];

  final List<String> _notificationSubtitle = [
    'Please share your experience with us',
    'Congratulation  👏🏻',
    'Hey!, How are you?',
  ];

  final List<PageRouteInfo<dynamic>> _routes = const [
    item.Dashboard(),
    item.Button(),
    item.Rating(),
    item.Badge(),
    item.Toast(),
    item.AlertDialogBox(),
    item.Modal(),
    item.BasicEmail(),
    item.AlertEmail(),
    item.BillingEmail(),
    item.Loaders(),
    item.MorrisChart(),
    item.ChartListChart(),
    item.ChartJsChart(),
    item.BasicTable(),
    item.Datatable(),
    item.ResponsiveTable(),
    item.EditableTable(),
    item.TimelineScreen(),
    item.Pricing(),
    item.DirectoryRoute(),
    item.FAQs(),
    item.Invoice(),
    item.Gallery(),
    item.Carousel(),
    item.TabScreen(),
    item.Calendar(),
    item.ElementsForm(),
    item.ValidationForm(),
    item.FileUploadForm(),
    item.RepeaterForm(),
    item.WizardForm(),
    item.MaskForm(),
    item.VideoScreen(),
    item.GoogleMaps(),
    item.UserProfile(),
    item.UsersViewTest(),
    item.CategoriesViewTest(),
    item.ProductsViewTest(),
    item.TransfersViewTest(),
    item.MovementsViewTest(),
    item.StocksViewTest(),
    item.VerificationsViewTest(),
    item.ListingsViewTest(),
    item.TransferViewTest(),
    item.ListingViewTest(),
    item.SalesViewTest()
  ];
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: _routes,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          resizeToAvoidBottomInset: true,
          key: _scaffoldKey,
          endDrawer: Drawer(
            width: 280,
            child: SafeArea(child: SettingDrawer(scaffoldKey: _scaffoldKey)),
          ),
          appBar: _appBar(tabsRouter),
          body: SafeArea(
            child: Scaffold(
              key: _scaffoldDrawerKey,
              drawerScrimColor: ColorConst.transparent,
              drawer: _sidebar(tabsRouter),
              body: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: isOpen,
                    builder: (context, value, child) {
                      return Responsive.isWeb(context)
                          ? _sidebar(tabsRouter)
                          : const SizedBox.shrink();
                    },
                  ),
                  Expanded(
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        final double contentHeight = constraints.maxHeight;

                        return SelectionArea(
                          child: SizedBox(
                            height: contentHeight,
                            child: CustomScrollView(
                              controller: _scrollController,
                              slivers: [
                                SliverList(
                                  delegate: SliverChildListDelegate(
                                    [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FxBox.h20,
                                            getRouteWidget(
                                                tabsRouter.activeIndex),
                                            FxBox.h20,
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SliverFillRemaining(
                                  hasScrollBody: false,
                                  fillOverscroll: true,
                                  child: Column(
                                    children: <Widget>[
                                      const Expanded(
                                        child: SizedBox.shrink(),
                                      ),
                                      _footer(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// appbar
  PreferredSizeWidget _appBar(TabsRouter tabsRouter) => AppBar(
        toolbarHeight: 70,
        elevation: 0.0,
        shadowColor: ColorConst.transparent,
        leadingWidth: 392,
        leading: Row(
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: isOpen,
              builder: (context, value, child) {
                if (Responsive.isWeb(context) && value) {
                  _scaffoldDrawerKey.currentState!.closeDrawer();
                  return InkWell(
                    onTap: () {
                      tabsRouter
                          .setActiveIndex(getRouteIndex(Strings.dashboard));
                      // _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                    child: Container(
                      width: 240,
                      padding: const EdgeInsets.symmetric(horizontal: 61),
                      height: double.infinity,
                      color: ColorConst.transparent,
                      child: Image.asset(
                          isDark ? Images.lgDarkLogo : Images.lgLightLogo),
                    ),
                  );
                }
                return InkWell(
                  onTap: () {
                    tabsRouter.setActiveIndex(getRouteIndex(Strings.dashboard));
                    _scaffoldDrawerKey.currentState?.closeDrawer();
                  },
                  child: Container(
                    width: 70,
                    height: double.infinity,
                    color:
                        isDark ? ColorConst.transparent : ColorConst.drawerBG,
                    child: Image.asset(
                      Images.smLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
            MaterialButton(
              height: double.infinity,
              minWidth: 60,
              hoverColor: ColorConst.transparent,
              onPressed: () async {
                if (Responsive.isMobile(context) ||
                    Responsive.isTablet(context)) {
                  if (_scaffoldDrawerKey.currentState!.isDrawerOpen) {
                    _scaffoldDrawerKey.currentState!.closeDrawer();
                  } else {
                    _scaffoldDrawerKey.currentState!.openDrawer();
                  }
                } else if (Responsive.isWeb(context)) {
                  _scaffoldDrawerKey.currentState!.closeDrawer();
                  isOpen.value = !isOpen.value;
                }
              },
              child: const SvgIcon(icon: IconlyBroken.drawer),
            )
          ],
        ),
        actions: [
          _notification(),
          BlocBuilder<ThemeModeBloc, ThemeModeState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        HiveUtils.set(HiveKeys.themeMode, !isDark);
                        themeModeBloc.add(ThemeModeEvent.changeTheme(!isDark));
                      },
                      icon: Icon(
                        isDark
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          _profile(tabsRouter),
        ],
      );

  Widget _notification() {
    return FxDropdownButton(
      focusColor: Colors.transparent,
      underline: FxBox.shrink,
      customButton: const MaterialButton(
        height: double.infinity,
        minWidth: 60,
        hoverColor: ColorConst.transparent,
        onPressed: null,
        child: SvgIcon(icon: IconlyBroken.notification),
      ),
      customItemsIndexes: const [1],
      customItemsHeight: 0,
      onChanged: (value) {},
      dropdownWidth: 298,
      dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
      dropdownDecoration: BoxDecoration(
        color: isDark ? ColorConst.cardDark : Colors.white,
        border: Border.all(
          color: isDark
              ? ColorConst.lightGrey.withOpacity(0.1)
              : ColorConst.lightGrey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      scrollbarAlwaysShow: false,
      dropdownElevation: 0,
      offset: const Offset(246, -20),
      itemHeight: 250,
      items: [
        DropdownMenuItem(
          alignment: AlignmentDirectional.topStart,
          value: '',
          child: SizedBox(
            height: 250,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: ScrollController(),
                physics: const PageScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                      child: Text(
                        '${Strings.notifications} (258)',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FxBox.h8,
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _notificationTitle.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            title: Text(
                              _notificationTitle[index],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              _notificationSubtitle[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .color!
                                        .withOpacity(0.5),
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(color: ColorConst.lightGrey, height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          Strings.viewAll,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _profile(TabsRouter tabsRouter) {
    final userFormProvider = Provider.of<AuthProvider>(context);
    final user = userFormProvider.user!;

    final image = (user.img == null)
        ? const CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/no-image.jpg'),
          )
        : CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(user.img!),
          );

    return FxDropdownButton(
      focusColor: Colors.transparent,
      underline: FxBox.shrink,
      customButton: MaterialButton(
          height: double.infinity,
          minWidth: 60,
          hoverColor: ColorConst.transparent,
          onPressed: null,
          child: image),
      customItemsIndexes: const [3],
      customItemsHeight: 8,
      onChanged: (value) {
        if (value == 'Profile') {
          // context.router.push(const MenuBar());
          tabsRouter.setActiveIndex(getRouteIndex(Strings.userProfile));
          _scaffoldDrawerKey.currentState?.closeDrawer();
        }
      },
      items: [
        ..._items.map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const DropdownMenuItem<Divider>(
          enabled: false,
          child: Divider(color: ColorConst.lightGrey),
        ),
        DropdownMenuItem(
          value: 'Desconectar',
          onTap: () {
            Provider.of<AuthProvider>(context, listen: false).logout();
          },
          child: const Text(
            Strings.logout,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
      itemHeight: 48,
      itemPadding: const EdgeInsets.only(left: 16, right: 16),
      dropdownWidth: 160,
      dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
      dropdownDecoration: BoxDecoration(
        color: isDark ? ColorConst.cardDark : Colors.white,
        border: Border.all(
          color: isDark
              ? ColorConst.lightGrey.withOpacity(0.1)
              : ColorConst.lightGrey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      dropdownElevation: 0,
      offset: const Offset(-108, 0),
    );
  }

  /// drawer / sidebar
  Widget _sidebar(TabsRouter tabsRouter) => ValueListenableBuilder<bool>(
        valueListenable: isOpen,
        builder: (context, value, child) {
          final userFormProvider = Provider.of<AuthProvider>(context);
          final user = userFormProvider.user!;
          return Container(
            height: MediaQuery.of(context).size.height,
            width: value ? 300 : 70,
            color: isDark ? ColorConst.scaffoldDark : ColorConst.drawerBG,
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxBox.h8,
                  UserInfo(
                    imageUrl: user.img!,
                    name: user.nombre,
                    role: user.rol,
                  ),
                  FxBox.h8,
                  // components
                  // if (value) _menuHeading(Strings.components),
                  _menuList(
                    tabsRouter: tabsRouter,
                    items: componentData,
                    isExpanded: true,
                    children: componentsExpandList,
                    isopen: value,
                  ),
                  // extras

                  FxBox.h20,
                ],
              ),
            ),
          );
        },
      );

  /// menu list
  Widget _menuList({
    required TabsRouter tabsRouter,
    required Map<String, IconData> items,
    bool isExpanded = false,
    List<List<String>> children = const [],
    required bool isopen,
  }) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => FxHover(
        builder: (isHover) {
          Color color = isHover
              ? isDark
                  ? ColorConst.chartForgoundColor
                  : ColorConst.primary
              : isDark
                  ? ColorConst.white
                  : ColorConst.black;
          if (isExpanded) {
            return isopen
                ? FxExpansionTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FxBox.w(22.0),
                        Icon(
                          items.values.elementAt(index),
                          size: 24,
                          color: children[index]
                                  .contains(upperCase(tabsRouter.currentPath))
                              ? isDark
                                  ? ColorConst.chartForgoundColor
                                  : ColorConst.primary
                              : color,
                        ),
                        FxBox.w(24.0),
                      ],
                    ),
                    title: Text(
                      items.keys.elementAt(index),
                      style: TextStyle(
                          color: children[index]
                                  .contains(upperCase(tabsRouter.currentPath))
                              ? isDark
                                  ? ColorConst.chartForgoundColor
                                  : ColorConst.primary
                              : color,
                          fontSize: 15.7),
                    ),
                    trailing: Icon(
                      Icons.expand_more_rounded,
                      size: 22,
                      color: children[index]
                              .contains(upperCase(tabsRouter.currentPath))
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    children: [_subMenuList(children[index], tabsRouter)],
                  )
                : ListTile(
                    leading: Icon(
                      items.values.elementAt(index),
                      size: isopen ? 22 : 24,
                      color: items.keys.elementAt(index) ==
                              upperCase(tabsRouter.currentPath)
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    title: isopen
                        ? Text(
                            items.keys.elementAt(index),
                            style: TextStyle(
                              color: items.keys.elementAt(index) ==
                                      upperCase(tabsRouter.currentPath)
                                  ? isDark
                                      ? ColorConst.chartForgoundColor
                                      : ColorConst.primary
                                  : color,
                              fontSize: 15.7,
                            ),
                          )
                        : null,
                    mouseCursor: SystemMouseCursors.click,
                    horizontalTitleGap: 0.0,
                    onTap: () {
                      isOpen.value = true;
                      _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                  );
          } else {
            return Row(
              children: [
                if (isopen)
                  Container(
                    width: 6.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: items.keys.elementAt(index) ==
                              upperCase(tabsRouter.currentPath)
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : ColorConst.transparent,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(6.0),
                        bottomRight: Radius.circular(6.0),
                      ),
                    ),
                  ),
                if (isopen) FxBox.w16,
                Expanded(
                  child: ListTile(
                    leading: Icon(
                      items.values.elementAt(index),
                      size: isopen ? 22 : 24,
                      color: items.keys.elementAt(index) ==
                              upperCase(tabsRouter.currentPath)
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    title: isopen
                        ? Text(
                            items.keys.elementAt(index),
                            style: TextStyle(
                              color: items.keys.elementAt(index) ==
                                      upperCase(tabsRouter.currentPath)
                                  ? isDark
                                      ? ColorConst.chartForgoundColor
                                      : ColorConst.primary
                                  : color,
                              fontSize: 15.7,
                            ),
                          )
                        : null,
                    mouseCursor: SystemMouseCursors.click,
                    horizontalTitleGap: 0.0,
                    onTap: () {
                      isOpen.value = true;
                      context.router.pushNamed(items.keys.elementAt(index));

                      _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  /// sub menu list
  Widget _subMenuList(List<String> items, TabsRouter tabsRouter) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => FxHover(
        builder: (isHover) {
          Color color = isHover
              ? isDark
                  ? ColorConst.chartForgoundColor
                  : ColorConst.primary
              : upperCase(tabsRouter.currentPath) == items[index]
                  ? isDark
                      ? ColorConst.chartForgoundColor
                      : ColorConst.primary
                  : isDark
                      ? ColorConst.white
                      : ColorConst.black;
          return Row(
            children: [
              Container(
                width: 6.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: upperCase(tabsRouter.currentPath) == items[index]
                      ? isDark
                          ? ColorConst.chartForgoundColor
                          : ColorConst.primary
                      : ColorConst.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(6.0),
                    bottomRight: Radius.circular(6.0),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -3),
                  mouseCursor: SystemMouseCursors.click,
                  contentPadding: const EdgeInsets.only(left: 52.0),
                  title: Text(
                    items[index],
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                  onTap: () {
                    tabsRouter.setActiveIndex(getRouteIndex(items[index]));
                    _scaffoldDrawerKey.currentState?.closeDrawer();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _footer() => Container(
        color: isDark ? ColorConst.footerDark : ColorConst.drawerBG,
        height: 60,
        width: Responsive.isWeb(context)
            ? MediaQuery.of(context).size.width - 240
            : MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: const Text(Strings.footerText),
      );
}
