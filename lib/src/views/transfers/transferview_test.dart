import 'package:admin_dashboard/proy/models/note.dart';
import 'package:admin_dashboard/proy/providers/transfers_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/views/transfers/transfer_create_view_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TransferViewTest extends StatefulWidget {
  const TransferViewTest({super.key});

  @override
  State<TransferViewTest> createState() => _TransferViewTestState();
}

class _TransferViewTestState extends State<TransferViewTest> {
  final List<Note> _notes = [];

  String noteText = '';

  void onDeleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final transferProvider =
        Provider.of<TransfersProvider>(context, listen: false);
    final size = MediaQuery.of(context).size.height;
    final tabsRouter = AutoTabsRouter.of(context);

    return SizedBox(
      height: size - 80 - 90,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => tabsRouter.setActiveIndex(39),
          ),
          title: const Text("Crear traspaso"),
          actions: [
            TextButton(
              child: const Text("Guardar"),
              onPressed: () async {
                try {
                  await transferProvider.newTransfer(_notes);
                  tabsRouter.setActiveIndex(39);
                  NotificationsService.showSnackbar('Traspaso creado!');

                  // ignore: use_build_context_synchronously
                } catch (e) {
                  tabsRouter.setActiveIndex(39);
                  NotificationsService.showSnackbarError(
                      'No se pudo guardar el traspaso');
                }
              },
            ),
          ],
        ),
        body: ProductsListView(
          notes: _notes,
          onDeleteNote: onDeleteNote,
        ),
        floatingActionButton: MediaQuery.of(context).size.width > 600
            ? FloatingActionButton.extended(
                icon: const Icon(Icons.add),
                label: const Text('Añadir producto'),
                onPressed: () => showDialogProduct(context),
              )
            : FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => showDialogProduct(context),
              ),
      ),
    );
  }

  Future<dynamic> showDialogProduct(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Agregar producto"),
          content: SingleChildScrollView(
            child: TransferCreateViewTest(
              didSubmitText: (destino, origen, producto, cajas, piezas) {
                setState(() {
                  _notes.add(Note(
                      destino: destino,
                      origen: origen,
                      producto: producto,
                      cantidadCajas: cajas,
                      cantidadPiezas: piezas));
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class ProductsListView extends StatelessWidget {
  final Function onDeleteNote;

  const ProductsListView({
    Key? key,
    required List<Note> notes,
    required this.onDeleteNote,
  })  : _notes = notes,
        super(key: key);

  final List<Note> _notes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _notes.length,
      itemBuilder: (context, index) {
        final note = _notes[index];

        final image = (note.producto.img == null)
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: const Image(
                  fit: BoxFit.fitHeight,
                  image: AssetImage('assets/no-image.jpg'),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loader.gif',
                  image: note.producto.img!,
                  fit: BoxFit.fitWidth,
                ),
              );

        return Center(
          child: Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                onDeleteNote(index);
              }
            },
            background: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 50),
                child: const Icon(Icons.delete_outline_rounded)),
            child: Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.all(16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.assetNetwork(
                          placeholder:
                              'assets/placeholder_image.jpg', // Ruta de la imagen a mostrar mientras se carga la imagen real
                          image: note.producto.img!, // Url de la imagen real
                          fit: BoxFit
                              .cover, // Estilo de ajuste de la imagen dentro del contenedor
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note.producto.nombre,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Divider(),
                            const SizedBox(height: 8),
                            Text(
                              "Cajas: ${note.cantidadCajas}",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Piezas: ${note.cantidadPiezas}",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Origen: ${note.origen.sucursal.definicion}",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Origen: ${note.destino.sucursal.definicion}",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
