import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/src/views/movements/inputcreateView_test.dart';
import 'package:admin_dashboard/src/views/movements/movementscardsview.dart';
import 'package:admin_dashboard/src/views/movements/outputcreateView_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MovementsViewTest extends StatefulWidget {
  const MovementsViewTest({Key? key}) : super(key: key);

  @override
  _MovementsViewTestState createState() => _MovementsViewTestState();
}

class _MovementsViewTestState extends State<MovementsViewTest> {
  bool isOpen = false;
  bool isSearchOpen = false;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false).getProducts();
    Provider.of<MovementsProvider>(context, listen: false)
        .getProductEntriesAndExits();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    final movementsProvider = Provider.of<MovementsProvider>(context);

    final productEntries = movementsProvider.productEntries;
    final productExits = movementsProvider.productExits;

    return SizedBox(
      height: size - 75 - 115,
      child: Scaffold(
        appBar: AppBar(
          title: isSearchOpen ? _buildSearchField() : const Text("Movimientos"),
          actions: _buildActions(),
        ),
        body: MovementsCardsView(
          productEntries: productEntries,
          productExits: productExits,
        ),
        floatingActionButton: _buildFloatingActionButton(),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      autofocus: true,
      onChanged: (query) => setState(() async {
        searchQuery = query;
        await Provider.of<MovementsProvider>(context, listen: false)
            .getProductMovementsByProductName(searchQuery);
      }),
      decoration: InputDecoration(
        hintText: "Buscar producto...",
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => setState(() {
            if (searchQuery.isEmpty) {
              isSearchOpen = false;
            } else {
              searchQuery = '';
            }
          }),
        ),
      ),
    );
  }

  List<Widget> _buildActions() {
    if (isSearchOpen) {
      return [];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          setState(() {
            isSearchOpen = true;
          });
        },
      )
    ];
  }

  Widget _buildFloatingActionButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildAnimatedFab(
          'fab1',
          Icons.input,
          'Crear entrada',
          () {
            _showDialogInput(context);
          },
        ),
        const SizedBox(height: 10),
        _buildAnimatedFab(
          'fab2',
          Icons.output,
          'Crear salida',
          () {
            _showDialogOutput(context);
          },
        ),
        const SizedBox(height: 10),
        FloatingActionButton.extended(
          heroTag: 'fab3',
          onPressed: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          icon: Icon(isOpen ? Icons.close : Icons.add),
          label: Text(isOpen ? 'Cancelar' : 'Crear movimiento'),
        ),
      ],
    );
  }

  Widget _buildAnimatedFab(
      String heroTag, IconData icon, String label, VoidCallback onPressed) {
    return IgnorePointer(
      ignoring: !isOpen,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isOpen ? 1 : 0,
        child: FloatingActionButton.extended(
          heroTag: heroTag,
          onPressed: onPressed,
          icon: Icon(icon),
          label: Text(label),
        ),
      ),
    );
  }

  void _showDialogInput(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("Crear entrada de productos"),
          content: SingleChildScrollView(
            child: InputViewCreateTest(),
          ),
        );
      },
    );
  }

  void _showDialogOutput(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text("Crear salida de productos"),
          content: SingleChildScrollView(
            child: OutputViewCreateTest(),
          ),
        );
      },
    );
  }
}
