// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin_dashboard/src/views/authentication/lock_screen/lock_screen_one.dart'
    as _i1;
import 'package:admin_dashboard/src/views/authentication/lock_screen/lock_screen_two.dart'
    as _i2;
import 'package:admin_dashboard/src/views/authentication/login/login_one.dart'
    as _i3;
import 'package:admin_dashboard/src/views/authentication/login/login_two.dart'
    as _i4;
import 'package:admin_dashboard/src/views/authentication/recover_password/recover_password_one.dart'
    as _i5;
import 'package:admin_dashboard/src/views/authentication/recover_password/recover_password_two.dart'
    as _i6;
import 'package:admin_dashboard/src/views/authentication/register/register_one.dart'
    as _i7;
import 'package:admin_dashboard/src/views/authentication/register/register_two.dart'
    as _i8;
import 'package:admin_dashboard/src/views/calender/calender.dart' as _i9;
import 'package:admin_dashboard/src/views/categories/categoriesview_test.dart'
    as _i10;
import 'package:admin_dashboard/src/views/charts/chartist.dart' as _i11;
import 'package:admin_dashboard/src/views/charts/chartjs.dart' as _i12;
import 'package:admin_dashboard/src/views/charts/morris_chart.dart' as _i13;
import 'package:admin_dashboard/src/views/dashboard/dashboard.dart' as _i14;
import 'package:admin_dashboard/src/views/email_templates/alert_email.dart'
    as _i15;
import 'package:admin_dashboard/src/views/email_templates/basic_email.dart'
    as _i16;
import 'package:admin_dashboard/src/views/email_templates/billing_email.dart'
    as _i17;
import 'package:admin_dashboard/src/views/extra_pages/coming_soon.dart' as _i18;
import 'package:admin_dashboard/src/views/extra_pages/directory.dart' as _i19;
import 'package:admin_dashboard/src/views/extra_pages/error_404.dart' as _i20;
import 'package:admin_dashboard/src/views/extra_pages/error_500.dart' as _i21;
import 'package:admin_dashboard/src/views/extra_pages/faqs.dart' as _i22;
import 'package:admin_dashboard/src/views/extra_pages/gallery.dart' as _i23;
import 'package:admin_dashboard/src/views/extra_pages/invoice.dart' as _i24;
import 'package:admin_dashboard/src/views/extra_pages/maintenance.dart' as _i25;
import 'package:admin_dashboard/src/views/extra_pages/pricing.dart' as _i26;
import 'package:admin_dashboard/src/views/extra_pages/timeline.dart' as _i27;
import 'package:admin_dashboard/src/views/forms/elements_form.dart' as _i28;
import 'package:admin_dashboard/src/views/forms/file_upload_form.dart' as _i29;
import 'package:admin_dashboard/src/views/forms/mask_form.dart' as _i30;
import 'package:admin_dashboard/src/views/forms/repeater_form.dart' as _i31;
import 'package:admin_dashboard/src/views/forms/validation_form.dart' as _i32;
import 'package:admin_dashboard/src/views/forms/wizard_form.dart' as _i33;
import 'package:admin_dashboard/src/views/listings/listingsview_test.dart'
    as _i34;
import 'package:admin_dashboard/src/views/listings/listingview_test.dart'
    as _i35;
import 'package:admin_dashboard/src/views/map/map.dart' as _i36;
import 'package:admin_dashboard/src/views/menu_bar.dart' as _i37;
import 'package:admin_dashboard/src/views/movements/movementsview_test.dart'
    as _i38;
import 'package:admin_dashboard/src/views/movements/verificationsview_test.dart'
    as _i39;
import 'package:admin_dashboard/src/views/products/productsview_test.dart'
    as _i40;
import 'package:admin_dashboard/src/views/providers/providersview_test.dart'
    as _i41;
import 'package:admin_dashboard/src/views/sales/salesview_test.dart' as _i42;
import 'package:admin_dashboard/src/views/sales/saleview_test.dart' as _i43;
import 'package:admin_dashboard/src/views/stock/stocksview_test.dart' as _i44;
import 'package:admin_dashboard/src/views/tables/basic_table.dart' as _i45;
import 'package:admin_dashboard/src/views/tables/data_tables.dart' as _i46;
import 'package:admin_dashboard/src/views/tables/editable_table.dart' as _i47;
import 'package:admin_dashboard/src/views/tables/responsive_table.dart' as _i48;
import 'package:admin_dashboard/src/views/transfers/transfers_view_test.dart'
    as _i49;
import 'package:admin_dashboard/src/views/transfers/transferview_test.dart'
    as _i50;
import 'package:admin_dashboard/src/views/ui_elements/alert/alert_dialog.dart'
    as _i51;
import 'package:admin_dashboard/src/views/ui_elements/badge/badge.dart' as _i52;
import 'package:admin_dashboard/src/views/ui_elements/buttons/button.dart'
    as _i53;
import 'package:admin_dashboard/src/views/ui_elements/carousel/carousel.dart'
    as _i54;
import 'package:admin_dashboard/src/views/ui_elements/loader/loader.dart'
    as _i55;
import 'package:admin_dashboard/src/views/ui_elements/modal/modal.dart' as _i56;
import 'package:admin_dashboard/src/views/ui_elements/rating/rating.dart'
    as _i57;
import 'package:admin_dashboard/src/views/ui_elements/tabbar/tabs_screen.dart'
    as _i58;
import 'package:admin_dashboard/src/views/ui_elements/toast/toast.dart' as _i59;
import 'package:admin_dashboard/src/views/ui_elements/videos/video_screen.dart'
    as _i60;
import 'package:admin_dashboard/src/views/user/user_profile.dart' as _i61;
import 'package:admin_dashboard/src/views/users/usersview_test.dart' as _i62;
import 'package:auto_route/auto_route.dart' as _i63;

abstract class $AppRouter extends _i63.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i63.PageFactory> pagesMap = {
    LockScreenOne.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LockScreenOne(),
      );
    },
    LockScreenTwo.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LockScreenTwo(),
      );
    },
    LoginOne.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginOne(),
      );
    },
    LoginTwo.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginTwo(),
      );
    },
    RecoverPasswordOne.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RecoverPasswordOne(),
      );
    },
    RecoverPasswordTwo.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RecoverPasswordTwo(),
      );
    },
    RegisterOne.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RegisterOne(),
      );
    },
    RegisterTwo.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.RegisterTwo(),
      );
    },
    Calendar.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.Calendar(),
      );
    },
    CategoriesViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CategoriesViewTest(),
      );
    },
    ChartListChart.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ChartListChart(),
      );
    },
    ChartJsChart.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ChartJsChart(),
      );
    },
    MorrisChart.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MorrisChart(),
      );
    },
    Dashboard.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.Dashboard(),
      );
    },
    AlertEmail.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.AlertEmail(),
      );
    },
    BasicEmail.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.BasicEmail(),
      );
    },
    BillingEmail.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.BillingEmail(),
      );
    },
    ComingSoon.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.ComingSoon(),
      );
    },
    DirectoryRoute.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.DirectoryPage(),
      );
    },
    Error404.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.Error404(),
      );
    },
    Error500.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.Error500(),
      );
    },
    FAQs.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.FAQs(),
      );
    },
    Gallery.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.Gallery(),
      );
    },
    Invoice.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.Invoice(),
      );
    },
    Maintenance.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.Maintenance(),
      );
    },
    Pricing.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.Pricing(),
      );
    },
    TimelineScreen.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.TimelineScreen(),
      );
    },
    ElementsForm.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.ElementsForm(),
      );
    },
    FileUploadForm.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.FileUploadForm(),
      );
    },
    MaskForm.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.MaskForm(),
      );
    },
    RepeaterForm.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.RepeaterForm(),
      );
    },
    ValidationForm.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.ValidationForm(),
      );
    },
    WizardForm.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.WizardForm(),
      );
    },
    ListingsViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i34.ListingsViewTest(),
      );
    },
    ListingViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i35.ListingViewTest(),
      );
    },
    GoogleMaps.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i36.GoogleMaps(),
      );
    },
    MenuBar.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i37.MenuBar(),
      );
    },
    MovementsViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i38.MovementsViewTest(),
      );
    },
    VerificationsViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i39.VerificationsViewTest(),
      );
    },
    ProductsViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i40.ProductsViewTest(),
      );
    },
    ProvidersViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i41.ProvidersViewTest(),
      );
    },
    SalesViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i42.SalesViewTest(),
      );
    },
    SaleViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i43.SaleViewTest(),
      );
    },
    StocksViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i44.StocksViewTest(),
      );
    },
    BasicTable.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i45.BasicTable(),
      );
    },
    Datatable.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i46.Datatable(),
      );
    },
    EditableTable.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i47.EditableTable(),
      );
    },
    ResponsiveTable.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i48.ResponsiveTable(),
      );
    },
    TransfersViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i49.TransfersViewTest(),
      );
    },
    TransferViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i50.TransferViewTest(),
      );
    },
    AlertDialogBox.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i51.AlertDialogBox(),
      );
    },
    Badge.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i52.Badge(),
      );
    },
    Button.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i53.Button(),
      );
    },
    Carousel.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i54.Carousel(),
      );
    },
    Loaders.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i55.Loaders(),
      );
    },
    Modal.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i56.Modal(),
      );
    },
    Rating.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i57.Rating(),
      );
    },
    TabScreen.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i58.TabScreen(),
      );
    },
    Toast.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i59.Toast(),
      );
    },
    VideoScreen.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i60.VideoScreen(),
      );
    },
    UserProfile.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i61.UserProfile(),
      );
    },
    UsersViewTest.name: (routeData) {
      return _i63.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i62.UsersViewTest(),
      );
    },
  };
}

/// generated route for
/// [_i1.LockScreenOne]
class LockScreenOne extends _i63.PageRouteInfo<void> {
  const LockScreenOne({List<_i63.PageRouteInfo>? children})
      : super(
          LockScreenOne.name,
          initialChildren: children,
        );

  static const String name = 'LockScreenOne';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LockScreenTwo]
class LockScreenTwo extends _i63.PageRouteInfo<void> {
  const LockScreenTwo({List<_i63.PageRouteInfo>? children})
      : super(
          LockScreenTwo.name,
          initialChildren: children,
        );

  static const String name = 'LockScreenTwo';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginOne]
class LoginOne extends _i63.PageRouteInfo<void> {
  const LoginOne({List<_i63.PageRouteInfo>? children})
      : super(
          LoginOne.name,
          initialChildren: children,
        );

  static const String name = 'LoginOne';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginTwo]
class LoginTwo extends _i63.PageRouteInfo<void> {
  const LoginTwo({List<_i63.PageRouteInfo>? children})
      : super(
          LoginTwo.name,
          initialChildren: children,
        );

  static const String name = 'LoginTwo';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RecoverPasswordOne]
class RecoverPasswordOne extends _i63.PageRouteInfo<void> {
  const RecoverPasswordOne({List<_i63.PageRouteInfo>? children})
      : super(
          RecoverPasswordOne.name,
          initialChildren: children,
        );

  static const String name = 'RecoverPasswordOne';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RecoverPasswordTwo]
class RecoverPasswordTwo extends _i63.PageRouteInfo<void> {
  const RecoverPasswordTwo({List<_i63.PageRouteInfo>? children})
      : super(
          RecoverPasswordTwo.name,
          initialChildren: children,
        );

  static const String name = 'RecoverPasswordTwo';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RegisterOne]
class RegisterOne extends _i63.PageRouteInfo<void> {
  const RegisterOne({List<_i63.PageRouteInfo>? children})
      : super(
          RegisterOne.name,
          initialChildren: children,
        );

  static const String name = 'RegisterOne';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RegisterTwo]
class RegisterTwo extends _i63.PageRouteInfo<void> {
  const RegisterTwo({List<_i63.PageRouteInfo>? children})
      : super(
          RegisterTwo.name,
          initialChildren: children,
        );

  static const String name = 'RegisterTwo';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i9.Calendar]
class Calendar extends _i63.PageRouteInfo<void> {
  const Calendar({List<_i63.PageRouteInfo>? children})
      : super(
          Calendar.name,
          initialChildren: children,
        );

  static const String name = 'Calendar';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CategoriesViewTest]
class CategoriesViewTest extends _i63.PageRouteInfo<void> {
  const CategoriesViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          CategoriesViewTest.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ChartListChart]
class ChartListChart extends _i63.PageRouteInfo<void> {
  const ChartListChart({List<_i63.PageRouteInfo>? children})
      : super(
          ChartListChart.name,
          initialChildren: children,
        );

  static const String name = 'ChartListChart';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ChartJsChart]
class ChartJsChart extends _i63.PageRouteInfo<void> {
  const ChartJsChart({List<_i63.PageRouteInfo>? children})
      : super(
          ChartJsChart.name,
          initialChildren: children,
        );

  static const String name = 'ChartJsChart';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i13.MorrisChart]
class MorrisChart extends _i63.PageRouteInfo<void> {
  const MorrisChart({List<_i63.PageRouteInfo>? children})
      : super(
          MorrisChart.name,
          initialChildren: children,
        );

  static const String name = 'MorrisChart';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i14.Dashboard]
class Dashboard extends _i63.PageRouteInfo<void> {
  const Dashboard({List<_i63.PageRouteInfo>? children})
      : super(
          Dashboard.name,
          initialChildren: children,
        );

  static const String name = 'Dashboard';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i15.AlertEmail]
class AlertEmail extends _i63.PageRouteInfo<void> {
  const AlertEmail({List<_i63.PageRouteInfo>? children})
      : super(
          AlertEmail.name,
          initialChildren: children,
        );

  static const String name = 'AlertEmail';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i16.BasicEmail]
class BasicEmail extends _i63.PageRouteInfo<void> {
  const BasicEmail({List<_i63.PageRouteInfo>? children})
      : super(
          BasicEmail.name,
          initialChildren: children,
        );

  static const String name = 'BasicEmail';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i17.BillingEmail]
class BillingEmail extends _i63.PageRouteInfo<void> {
  const BillingEmail({List<_i63.PageRouteInfo>? children})
      : super(
          BillingEmail.name,
          initialChildren: children,
        );

  static const String name = 'BillingEmail';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i18.ComingSoon]
class ComingSoon extends _i63.PageRouteInfo<void> {
  const ComingSoon({List<_i63.PageRouteInfo>? children})
      : super(
          ComingSoon.name,
          initialChildren: children,
        );

  static const String name = 'ComingSoon';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i19.DirectoryPage]
class DirectoryRoute extends _i63.PageRouteInfo<void> {
  const DirectoryRoute({List<_i63.PageRouteInfo>? children})
      : super(
          DirectoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DirectoryRoute';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i20.Error404]
class Error404 extends _i63.PageRouteInfo<void> {
  const Error404({List<_i63.PageRouteInfo>? children})
      : super(
          Error404.name,
          initialChildren: children,
        );

  static const String name = 'Error404';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i21.Error500]
class Error500 extends _i63.PageRouteInfo<void> {
  const Error500({List<_i63.PageRouteInfo>? children})
      : super(
          Error500.name,
          initialChildren: children,
        );

  static const String name = 'Error500';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i22.FAQs]
class FAQs extends _i63.PageRouteInfo<void> {
  const FAQs({List<_i63.PageRouteInfo>? children})
      : super(
          FAQs.name,
          initialChildren: children,
        );

  static const String name = 'FAQs';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i23.Gallery]
class Gallery extends _i63.PageRouteInfo<void> {
  const Gallery({List<_i63.PageRouteInfo>? children})
      : super(
          Gallery.name,
          initialChildren: children,
        );

  static const String name = 'Gallery';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i24.Invoice]
class Invoice extends _i63.PageRouteInfo<void> {
  const Invoice({List<_i63.PageRouteInfo>? children})
      : super(
          Invoice.name,
          initialChildren: children,
        );

  static const String name = 'Invoice';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i25.Maintenance]
class Maintenance extends _i63.PageRouteInfo<void> {
  const Maintenance({List<_i63.PageRouteInfo>? children})
      : super(
          Maintenance.name,
          initialChildren: children,
        );

  static const String name = 'Maintenance';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i26.Pricing]
class Pricing extends _i63.PageRouteInfo<void> {
  const Pricing({List<_i63.PageRouteInfo>? children})
      : super(
          Pricing.name,
          initialChildren: children,
        );

  static const String name = 'Pricing';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i27.TimelineScreen]
class TimelineScreen extends _i63.PageRouteInfo<void> {
  const TimelineScreen({List<_i63.PageRouteInfo>? children})
      : super(
          TimelineScreen.name,
          initialChildren: children,
        );

  static const String name = 'TimelineScreen';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i28.ElementsForm]
class ElementsForm extends _i63.PageRouteInfo<void> {
  const ElementsForm({List<_i63.PageRouteInfo>? children})
      : super(
          ElementsForm.name,
          initialChildren: children,
        );

  static const String name = 'ElementsForm';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i29.FileUploadForm]
class FileUploadForm extends _i63.PageRouteInfo<void> {
  const FileUploadForm({List<_i63.PageRouteInfo>? children})
      : super(
          FileUploadForm.name,
          initialChildren: children,
        );

  static const String name = 'FileUploadForm';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i30.MaskForm]
class MaskForm extends _i63.PageRouteInfo<void> {
  const MaskForm({List<_i63.PageRouteInfo>? children})
      : super(
          MaskForm.name,
          initialChildren: children,
        );

  static const String name = 'MaskForm';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i31.RepeaterForm]
class RepeaterForm extends _i63.PageRouteInfo<void> {
  const RepeaterForm({List<_i63.PageRouteInfo>? children})
      : super(
          RepeaterForm.name,
          initialChildren: children,
        );

  static const String name = 'RepeaterForm';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i32.ValidationForm]
class ValidationForm extends _i63.PageRouteInfo<void> {
  const ValidationForm({List<_i63.PageRouteInfo>? children})
      : super(
          ValidationForm.name,
          initialChildren: children,
        );

  static const String name = 'ValidationForm';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i33.WizardForm]
class WizardForm extends _i63.PageRouteInfo<void> {
  const WizardForm({List<_i63.PageRouteInfo>? children})
      : super(
          WizardForm.name,
          initialChildren: children,
        );

  static const String name = 'WizardForm';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i34.ListingsViewTest]
class ListingsViewTest extends _i63.PageRouteInfo<void> {
  const ListingsViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          ListingsViewTest.name,
          initialChildren: children,
        );

  static const String name = 'ListingsViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i35.ListingViewTest]
class ListingViewTest extends _i63.PageRouteInfo<void> {
  const ListingViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          ListingViewTest.name,
          initialChildren: children,
        );

  static const String name = 'ListingViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i36.GoogleMaps]
class GoogleMaps extends _i63.PageRouteInfo<void> {
  const GoogleMaps({List<_i63.PageRouteInfo>? children})
      : super(
          GoogleMaps.name,
          initialChildren: children,
        );

  static const String name = 'GoogleMaps';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i37.MenuBar]
class MenuBar extends _i63.PageRouteInfo<void> {
  const MenuBar({List<_i63.PageRouteInfo>? children})
      : super(
          MenuBar.name,
          initialChildren: children,
        );

  static const String name = 'MenuBar';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i38.MovementsViewTest]
class MovementsViewTest extends _i63.PageRouteInfo<void> {
  const MovementsViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          MovementsViewTest.name,
          initialChildren: children,
        );

  static const String name = 'MovementsViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i39.VerificationsViewTest]
class VerificationsViewTest extends _i63.PageRouteInfo<void> {
  const VerificationsViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          VerificationsViewTest.name,
          initialChildren: children,
        );

  static const String name = 'VerificationsViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i40.ProductsViewTest]
class ProductsViewTest extends _i63.PageRouteInfo<void> {
  const ProductsViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          ProductsViewTest.name,
          initialChildren: children,
        );

  static const String name = 'ProductsViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i41.ProvidersViewTest]
class ProvidersViewTest extends _i63.PageRouteInfo<void> {
  const ProvidersViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          ProvidersViewTest.name,
          initialChildren: children,
        );

  static const String name = 'ProvidersViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i42.SalesViewTest]
class SalesViewTest extends _i63.PageRouteInfo<void> {
  const SalesViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          SalesViewTest.name,
          initialChildren: children,
        );

  static const String name = 'SalesViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i43.SaleViewTest]
class SaleViewTest extends _i63.PageRouteInfo<void> {
  const SaleViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          SaleViewTest.name,
          initialChildren: children,
        );

  static const String name = 'SaleViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i44.StocksViewTest]
class StocksViewTest extends _i63.PageRouteInfo<void> {
  const StocksViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          StocksViewTest.name,
          initialChildren: children,
        );

  static const String name = 'StocksViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i45.BasicTable]
class BasicTable extends _i63.PageRouteInfo<void> {
  const BasicTable({List<_i63.PageRouteInfo>? children})
      : super(
          BasicTable.name,
          initialChildren: children,
        );

  static const String name = 'BasicTable';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i46.Datatable]
class Datatable extends _i63.PageRouteInfo<void> {
  const Datatable({List<_i63.PageRouteInfo>? children})
      : super(
          Datatable.name,
          initialChildren: children,
        );

  static const String name = 'Datatable';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i47.EditableTable]
class EditableTable extends _i63.PageRouteInfo<void> {
  const EditableTable({List<_i63.PageRouteInfo>? children})
      : super(
          EditableTable.name,
          initialChildren: children,
        );

  static const String name = 'EditableTable';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i48.ResponsiveTable]
class ResponsiveTable extends _i63.PageRouteInfo<void> {
  const ResponsiveTable({List<_i63.PageRouteInfo>? children})
      : super(
          ResponsiveTable.name,
          initialChildren: children,
        );

  static const String name = 'ResponsiveTable';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i49.TransfersViewTest]
class TransfersViewTest extends _i63.PageRouteInfo<void> {
  const TransfersViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          TransfersViewTest.name,
          initialChildren: children,
        );

  static const String name = 'TransfersViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i50.TransferViewTest]
class TransferViewTest extends _i63.PageRouteInfo<void> {
  const TransferViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          TransferViewTest.name,
          initialChildren: children,
        );

  static const String name = 'TransferViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i51.AlertDialogBox]
class AlertDialogBox extends _i63.PageRouteInfo<void> {
  const AlertDialogBox({List<_i63.PageRouteInfo>? children})
      : super(
          AlertDialogBox.name,
          initialChildren: children,
        );

  static const String name = 'AlertDialogBox';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i52.Badge]
class Badge extends _i63.PageRouteInfo<void> {
  const Badge({List<_i63.PageRouteInfo>? children})
      : super(
          Badge.name,
          initialChildren: children,
        );

  static const String name = 'Badge';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i53.Button]
class Button extends _i63.PageRouteInfo<void> {
  const Button({List<_i63.PageRouteInfo>? children})
      : super(
          Button.name,
          initialChildren: children,
        );

  static const String name = 'Button';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i54.Carousel]
class Carousel extends _i63.PageRouteInfo<void> {
  const Carousel({List<_i63.PageRouteInfo>? children})
      : super(
          Carousel.name,
          initialChildren: children,
        );

  static const String name = 'Carousel';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i55.Loaders]
class Loaders extends _i63.PageRouteInfo<void> {
  const Loaders({List<_i63.PageRouteInfo>? children})
      : super(
          Loaders.name,
          initialChildren: children,
        );

  static const String name = 'Loaders';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i56.Modal]
class Modal extends _i63.PageRouteInfo<void> {
  const Modal({List<_i63.PageRouteInfo>? children})
      : super(
          Modal.name,
          initialChildren: children,
        );

  static const String name = 'Modal';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i57.Rating]
class Rating extends _i63.PageRouteInfo<void> {
  const Rating({List<_i63.PageRouteInfo>? children})
      : super(
          Rating.name,
          initialChildren: children,
        );

  static const String name = 'Rating';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i58.TabScreen]
class TabScreen extends _i63.PageRouteInfo<void> {
  const TabScreen({List<_i63.PageRouteInfo>? children})
      : super(
          TabScreen.name,
          initialChildren: children,
        );

  static const String name = 'TabScreen';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i59.Toast]
class Toast extends _i63.PageRouteInfo<void> {
  const Toast({List<_i63.PageRouteInfo>? children})
      : super(
          Toast.name,
          initialChildren: children,
        );

  static const String name = 'Toast';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i60.VideoScreen]
class VideoScreen extends _i63.PageRouteInfo<void> {
  const VideoScreen({List<_i63.PageRouteInfo>? children})
      : super(
          VideoScreen.name,
          initialChildren: children,
        );

  static const String name = 'VideoScreen';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i61.UserProfile]
class UserProfile extends _i63.PageRouteInfo<void> {
  const UserProfile({List<_i63.PageRouteInfo>? children})
      : super(
          UserProfile.name,
          initialChildren: children,
        );

  static const String name = 'UserProfile';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}

/// generated route for
/// [_i62.UsersViewTest]
class UsersViewTest extends _i63.PageRouteInfo<void> {
  const UsersViewTest({List<_i63.PageRouteInfo>? children})
      : super(
          UsersViewTest.name,
          initialChildren: children,
        );

  static const String name = 'UsersViewTest';

  static const _i63.PageInfo<void> page = _i63.PageInfo<void>(name);
}
