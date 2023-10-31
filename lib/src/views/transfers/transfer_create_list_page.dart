import 'package:admin_dashboard/blocs/transfer_create/transfer_create_bloc.dart';
import 'package:admin_dashboard/proy/models/note.dart';
import 'package:admin_dashboard/proy/providers/transfers_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/views/transfers/transfer_create_view_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class TransferCreateListPage extends StatefulWidget {
  const TransferCreateListPage({super.key});

  @override
  State<TransferCreateListPage> createState() => _TransferCreateListPageState();
}

class _TransferCreateListPageState extends State<TransferCreateListPage> {
  List<Note> list = [];
  var transferCreateBloc = TransferCreateBloc();
  bool isSubmit = false;
  @override
  Widget build(BuildContext context) {
    final transferProvider =
        Provider.of<TransfersProvider>(context, listen: false);
    return BlocProvider(
      create: (context) => transferCreateBloc,
      child: BlocConsumer<TransferCreateBloc, TransferCreateState>(
        listener: (context, state) {
          if (state is TransferAddedListNote) {
            setState(() {
              list.add(state.note);
            });
          }
        },
        builder: (context, state) {
          if (state is NavigatedTransferCreateList) {
            return TransferCreateViewTest();
          }
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 16,
                    color: Colors.black,
                  )),
              actions: [
                IconButton(
                    onPressed: () {
                      transferCreateBloc.add(NavigateTransferCreateList());
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
            body: Column(
              children: [
                Column(
                  children: list.map((e) {
                    return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text(
                              e.producto.nombre,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(e.origen.sucursal.municipio),
                                    Text(
                                      "- ${e.cantidadCajas} cajas",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "- ${e.cantidadPiezas} Piezas",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                ),
                                Column(
                                  children: [
                                    Text(e.destino.sucursal.municipio),
                                    Text(
                                      "+ ${e.cantidadCajas} cajas",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "+ ${e.cantidadPiezas} Piezas",
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ));
                  }).toList(),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ElevatedButton(
                onPressed: !isSubmit
                    ? () async {
                        try {
                          if (list.isNotEmpty) {
                            setState(() {
                              isSubmit = true;
                            });
                            await transferProvider
                                .newTransfer(list)
                                .then((value) {
                              NotificationsService.showSnackbar(
                                  'Traspaso creado!');
                              Navigator.pop(context);
                            });
                          } else {
                            setState(() {
                              isSubmit = false;
                            });
                            NotificationsService.showSnackbarError(
                                'No se pudo guardar el traspaso');
                          }

                          // ignore: use_build_context_synchronously
                        } catch (e) {
                          setState(() {
                            isSubmit = false;
                          });
                          NotificationsService.showSnackbarError(
                              'No se pudo guardar el traspaso');
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  backgroundColor: ColorConst.blue,
                ),
                child: const Text(
                  'Guardar',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
