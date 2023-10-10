import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/views/calender/calender.dart';
import 'package:admin_dashboard/src/views/categories/categoriesview_test.dart';
import 'package:admin_dashboard/src/views/charts/chartist.dart';
import 'package:admin_dashboard/src/views/charts/chartjs.dart';
import 'package:admin_dashboard/src/views/charts/morris_chart.dart';
import 'package:admin_dashboard/src/views/dashboard/dashboard.dart';
import 'package:admin_dashboard/src/views/email_templates/alert_email.dart';
import 'package:admin_dashboard/src/views/email_templates/basic_email.dart';
import 'package:admin_dashboard/src/views/email_templates/billing_email.dart';
import 'package:admin_dashboard/src/views/extra_pages/directory.dart';
import 'package:admin_dashboard/src/views/extra_pages/faqs.dart';
import 'package:admin_dashboard/src/views/extra_pages/gallery.dart';
import 'package:admin_dashboard/src/views/extra_pages/invoice.dart';
import 'package:admin_dashboard/src/views/extra_pages/pricing.dart';
import 'package:admin_dashboard/src/views/extra_pages/timeline.dart';
import 'package:admin_dashboard/src/views/forms/elements_form.dart';
import 'package:admin_dashboard/src/views/forms/file_upload_form.dart';
import 'package:admin_dashboard/src/views/forms/mask_form.dart';
import 'package:admin_dashboard/src/views/forms/repeater_form.dart';
import 'package:admin_dashboard/src/views/forms/validation_form.dart';
import 'package:admin_dashboard/src/views/forms/wizard_form.dart';
import 'package:admin_dashboard/src/views/listings/listingsview_test.dart';
import 'package:admin_dashboard/src/views/listings/listingview_test.dart';
import 'package:admin_dashboard/src/views/map/map.dart';
import 'package:admin_dashboard/src/views/movements/movementsview_test.dart';
import 'package:admin_dashboard/src/views/movements/verificationsview_test.dart';
import 'package:admin_dashboard/src/views/orders/ordersview_test.dart';
import 'package:admin_dashboard/src/views/orders/orderview_test.dart';
import 'package:admin_dashboard/src/views/products/productsview_test.dart';
import 'package:admin_dashboard/src/views/providers/providersview_test.dart';
import 'package:admin_dashboard/src/views/sales/salesview_test.dart';
import 'package:admin_dashboard/src/views/sales/saleview_test.dart';
import 'package:admin_dashboard/src/views/stock/stocksview_test.dart';
import 'package:admin_dashboard/src/views/tables/basic_table.dart';
import 'package:admin_dashboard/src/views/tables/data_tables.dart';
import 'package:admin_dashboard/src/views/tables/editable_table.dart';
import 'package:admin_dashboard/src/views/tables/responsive_table.dart';
import 'package:admin_dashboard/src/views/transfers/transfers_view_test.dart';
import 'package:admin_dashboard/src/views/transfers/transferview_test.dart';
import 'package:admin_dashboard/src/views/ui_elements/alert/alert_dialog.dart';
import 'package:admin_dashboard/src/views/ui_elements/badge/badge.dart' as item;
import 'package:admin_dashboard/src/views/ui_elements/buttons/button.dart';
import 'package:admin_dashboard/src/views/ui_elements/carousel/carousel.dart';
import 'package:admin_dashboard/src/views/ui_elements/loader/loader.dart';
import 'package:admin_dashboard/src/views/ui_elements/modal/modal.dart';
import 'package:admin_dashboard/src/views/ui_elements/rating/rating.dart';
import 'package:admin_dashboard/src/views/ui_elements/tabbar/tabs_screen.dart';
import 'package:admin_dashboard/src/views/ui_elements/toast/toast.dart';
import 'package:admin_dashboard/src/views/ui_elements/videos/video_screen.dart';
import 'package:admin_dashboard/src/views/user/user_profile.dart';
import 'package:admin_dashboard/src/views/users/usersview_test.dart';
import 'package:flutter/material.dart';

int getRouteIndex(String route) {
  if (route == Strings.buttons) {
    return 1;
  } else if (route == Strings.rating) {
    return 2;
  } else if (route == Strings.badge) {
    return 3;
  } else if (route == Strings.toast) {
    return 4;
  } else if (route == Strings.alertDialog) {
    return 5;
  } else if (route == Strings.modal) {
    return 6;
  } else if (route == Strings.basicActionEmail) {
    return 7;
  } else if (route == Strings.alertEmail) {
    return 8;
  } else if (route == Strings.billingEmail) {
    return 9;
  } else if (route == Strings.loader) {
    return 10;
  } else if (route == Strings.morrisChart) {
    return 11;
  } else if (route == Strings.chartistChart) {
    return 12;
  } else if (route == Strings.chartJsChart) {
    return 13;
  } else if (route == Strings.basicTable) {
    return 14;
  } else if (route == Strings.dataTable) {
    return 15;
  } else if (route == Strings.responsiveTable) {
    return 16;
  } else if (route == Strings.editableTable) {
    return 17;
  } else if (route == Strings.timeline) {
    return 18;
  } else if (route == Strings.pricing) {
    return 19;
  } else if (route == Strings.directory) {
    return 20;
  } else if (route == Strings.faqs) {
    return 21;
  } else if (route == Strings.invoice) {
    return 22;
  } else if (route == Strings.gallery) {
    return 23;
  } else if (route == Strings.carousel) {
    return 24;
  } else if (route == Strings.tabs) {
    return 25;
  } else if (route == Strings.calendar) {
    return 26;
  } else if (route == Strings.formElements) {
    return 27;
  } else if (route == Strings.formValidation) {
    return 28;
  } else if (route == Strings.formFileUpload) {
    return 29;
  } else if (route == Strings.formRepeater) {
    return 30;
  } else if (route == Strings.formWizard) {
    return 31;
  } else if (route == Strings.formMask) {
    return 32;
  } else if (route == Strings.videoPlayer) {
    return 33;
  } else if (route == Strings.map) {
    return 34;
  } else if (route == Strings.userProfile) {
    return 35;
  } else if (route == Strings.users) {
    return 36;
  } else if (route == Strings.categories) {
    return 37;
  } else if (route == Strings.products) {
    return 38;
  } else if (route == Strings.transfers) {
    return 39;
  } else if (route == Strings.movements) {
    return 40;
  } else if (route == Strings.stocks) {
    return 41;
  } else if (route == Strings.verifications) {
    return 42;
  } else if (route == Strings.listings) {
    return 43;
  } else if (route == Strings.transferCreate) {
    return 44;
  } else if (route == Strings.listingCreate) {
    return 45;
  } else if (route == Strings.salesView) {
    return 46;
  } else if (route == Strings.saleView) {
    return 47;
  } else if (route == Strings.providers) {
    return 48;
  } else if (route == Strings.orders) {
    return 49;
  } else if (route == Strings.orderCreate) {
    return 50;
  } else {
    return 0;
  }
}

Widget getRouteWidget(int index) {
  if (index == 1) {
    return const Button();
  } else if (index == 2) {
    return const Rating();
  } else if (index == 3) {
    return const item.Badge();
  } else if (index == 4) {
    return const Toast();
  } else if (index == 5) {
    return const AlertDialogBox();
  } else if (index == 6) {
    return const Modal();
  } else if (index == 7) {
    return const BasicEmail();
  } else if (index == 8) {
    return const AlertEmail();
  } else if (index == 9) {
    return const BillingEmail();
  } else if (index == 10) {
    return const Loaders();
  } else if (index == 11) {
    return const MorrisChart();
  } else if (index == 12) {
    return const ChartListChart();
  } else if (index == 13) {
    return const ChartJsChart();
  } else if (index == 14) {
    return const BasicTable();
  } else if (index == 15) {
    return const Datatable();
  } else if (index == 16) {
    return const ResponsiveTable();
  } else if (index == 17) {
    return const EditableTable();
  } else if (index == 18) {
    return const TimelineScreen();
  } else if (index == 19) {
    return const Pricing();
  } else if (index == 20) {
    return const DirectoryPage();
  } else if (index == 21) {
    return const FAQs();
  } else if (index == 22) {
    return const Invoice();
  } else if (index == 23) {
    return const Gallery();
  } else if (index == 24) {
    return const Carousel();
  } else if (index == 25) {
    return const TabScreen();
  } else if (index == 26) {
    return const Calendar();
  } else if (index == 27) {
    return const ElementsForm();
  } else if (index == 28) {
    return const ValidationForm();
  } else if (index == 29) {
    return const FileUploadForm();
  } else if (index == 30) {
    return const RepeaterForm();
  } else if (index == 31) {
    return const WizardForm();
  } else if (index == 32) {
    return const MaskForm();
  } else if (index == 33) {
    return const VideoScreen();
  } else if (index == 34) {
    return const GoogleMaps();
  } else if (index == 35) {
    return const UserProfile();
  } else if (index == 36) {
    return const UsersViewTest();
  } else if (index == 37) {
    return const CategoriesViewTest();
  } else if (index == 38) {
    return const ProductsViewTest();
  } else if (index == 39) {
    return const TransfersViewTest();
  } else if (index == 40) {
    return const MovementsViewTest();
  } else if (index == 41) {
    return const StocksViewTest();
  } else if (index == 42) {
    return const VerificationsViewTest();
  } else if (index == 43) {
    return const ListingsViewTest();
  } else if (index == 44) {
    return const TransferViewTest();
  } else if (index == 45) {
    return const ListingViewTest();
  } else if (index == 46) {
    return const SalesViewTest();
  } else if (index == 47) {
    return const SaleViewTest();
  } else if (index == 48) {
    return const ProvidersViewTest();
  } else if (index == 49) {
    return const OrdersViewTest();
  } else if (index == 50) {
    return const OrderViewTest();
  } else {
    return const Dashboard();
  }
}
