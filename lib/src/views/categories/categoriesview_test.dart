import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/src/views/categories/table_categories.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CategoriesViewTest extends StatefulWidget {
  const CategoriesViewTest({super.key});

  @override
  State<CategoriesViewTest> createState() => _CategoriesViewsTestState();
}

class _CategoriesViewsTestState extends State<CategoriesViewTest> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;

    return SizedBox(
      height: size - 75 - 95,
      child: const Scaffold(
        body: TableCategories(),
      ),
    );
  }
}
