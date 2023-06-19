import 'package:admin_dashboard/proy/providers/products_provider.dart';
import 'package:admin_dashboard/src/views/movements/inputcreateView_test.dart';
import 'package:admin_dashboard/src/views/movements/movementscardsview.dart';
import 'package:admin_dashboard/src/views/movements/outputcreateView_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovementsViewTest extends StatefulWidget {
  const MovementsViewTest({Key? key}) : super(key: key);

  @override
  State<MovementsViewTest> createState() => _MovementsViewTestState();
}

class _MovementsViewTestState extends State<MovementsViewTest> {
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;

    return SizedBox(
      height: size - 75 - 95,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movimientos"),
        ),
        body: const MovementsCardsView(),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isOpen ? 1 : 0,
              child: MediaQuery.of(context).size.width > 600
                  ? FloatingActionButton.extended(
                      heroTag: 'fab1',
                      onPressed: () {
                        // Acción para el primer botón flotante
                        _showDialogInput(context);
                      },
                      icon: const Icon(Icons.input),
                      label: const Text('Crear entrada'))
                  : FloatingActionButton(
                      onPressed: () {
                        _showDialogInput(context);
                      },
                      child: const Icon(Icons.input),
                    ),
            ),
            const SizedBox(height: 10),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isOpen ? 1 : 0,
              child: MediaQuery.of(context).size.width > 600
                  ? FloatingActionButton.extended(
                      heroTag: 'fab2',
                      onPressed: () {
                        _showDialogOutput(context);
                        // Acción para el segundo botón flotante
                      },
                      icon: const Icon(Icons.output),
                      label: const Text('Crear salida'))
                  : FloatingActionButton(
                      onPressed: () {
                        _showDialogOutput(context);
                      },
                      child: const Icon(Icons.output),
                    ),
            ),
            const SizedBox(height: 10),
            MediaQuery.of(context).size.width > 600
                ? FloatingActionButton.extended(
                    heroTag: 'fab3',
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    icon: Icon(isOpen ? Icons.close : Icons.add),
                    label: isOpen
                        ? MediaQuery.of(context).size.width > 600
                            ? const Text('Cancelar')
                            : Text('')
                        : MediaQuery.of(context).size.width > 600
                            ? const Text('Crear movimiento')
                            : Text(''),
                  )
                : FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    child: Icon(isOpen ? Icons.close : Icons.add),
                  ),
          ],
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
