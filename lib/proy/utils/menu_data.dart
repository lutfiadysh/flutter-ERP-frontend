import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/routes/routes.gr.dart';
import 'package:admin_dashboard/src/views/categories/category_page.dart';
import 'package:admin_dashboard/src/views/dashboard/movement_page.dart';
import 'package:admin_dashboard/src/views/dashboard/movements_report.dart';
import 'package:admin_dashboard/src/views/listings/listing_page.dart';
import 'package:admin_dashboard/src/views/movements/movementsview_test.dart';
import 'package:admin_dashboard/src/views/movements/verification_page.dart';
import 'package:admin_dashboard/src/views/orders/order_page.dart';
import 'package:admin_dashboard/src/views/orders/ordersview_test.dart';
import 'package:admin_dashboard/src/views/products/product_page.dart';
import 'package:admin_dashboard/src/views/providers/provider_page.dart';
import 'package:admin_dashboard/src/views/sales/sales_view_page.dart';
import 'package:admin_dashboard/src/views/stock/stock_page.dart';
import 'package:admin_dashboard/src/views/transfers/transfer_page.dart';
import 'package:admin_dashboard/src/views/users/users_page.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class MenuData {
  final String title;
  final IconData icon;
  final Function() onTap;

  const MenuData({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  static List<MenuData> fetchAdminitrationMenu(BuildContext context) {
    return [
      MenuData(
        icon: EneftyIcons.user_add_outline,
        title: Strings.users,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UsersPage()));
        },
      ),
      MenuData(
        icon: EneftyIcons.map_2_outline,
        title: Strings.providers,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProviderPage()));
        },
      ),
      MenuData(
        icon: EneftyIcons.category_2_outline,
        title: Strings.categories,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CategoryPage()));
        },
      ),
      MenuData(
        icon: EneftyIcons.box_2_outline,
        title: Strings.products,
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProductPage()));
        },
      ),
      MenuData(
        icon: EneftyIcons.truck_outline,
        title: Strings.orders,
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => OrderPage()));
        },
      ),
    ];
  }

  static List<MenuData> fetchInventoryMenu(context) {
    return [
      MenuData(
          icon: EneftyIcons.activity_bold,
          title: Strings.movements,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MovementPage()));
          }),
      MenuData(
          icon: EneftyIcons.route_square_outline,
          title: Strings.transfers,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TransferPage()));
          }),
      MenuData(
          icon: EneftyIcons.box_2_bold,
          title: Strings.stocks,
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => StockPage()));
          }),
      MenuData(
          icon: EneftyIcons.verify_outline,
          title: Strings.verifications,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => VerificationPage()));
          }),
    ];
  }

  static List<MenuData> fetchItemsMenu(context) {
    return [
      MenuData(
          icon: EneftyIcons.document_2_bold,
          title: Strings.listings,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListingPage()));
          }),
      MenuData(
          icon: EneftyIcons.chart_2_bold,
          title: "Ventas",
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SalesViewPage()));
          }),
    ];
  }
}
