import 'package:admin_dashboard/blocs/listing_create/listing_create_bloc.dart';
import 'package:admin_dashboard/proy/models/client.dart';
import 'package:admin_dashboard/proy/providers/clients_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ListingSelectClientPage extends StatefulWidget {
  const ListingSelectClientPage({super.key});

  @override
  State<ListingSelectClientPage> createState() =>
      _ListingSelectClientPageState();
}

class _ListingSelectClientPageState extends State<ListingSelectClientPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nitController = TextEditingController();
  TextEditingController ciController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Cliente? selectedClient;
  @override
  void initState() {
    Provider.of<ClientsProvider>(context, listen: false).getClients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var clientes = Provider.of<ClientsProvider>(context).clientes;
    return WillPopScope(
      onWillPop: () async {
        context.read<ListingCreateBloc>().add(BackToInitial());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              context.read<ListingCreateBloc>().add(BackToInitial());
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Colors.black,
            ),
          ),
          centerTitle: false,
          titleSpacing: 0,
          title: const Text(
            "Select cliente",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: DropdownSearch<Cliente>(
                    popupProps: const PopupProps.menu(
                      showSelectedItems: true,
                      showSearchBox: true,
                    ),
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: "Cliente",
                        hintText: "Seleccione un cliente",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    items: clientes,
                    onChanged: (Cliente? cliente) {
                      setState(() {
                        selectedClient = cliente;
                        nameController.text = cliente!.nombre;
                        nitController.text =
                            cliente.nit != null ? cliente.nit.toString() : '';
                        ciController.text =
                            cliente.ci != null ? cliente.ci.toString() : '';
                        phoneController.text = cliente.telefono != null
                            ? cliente.telefono.toString()
                            : '';
                      });
                    },
                    selectedItem: selectedClient,
                    itemAsString: (Cliente u) =>
                        'Nombre: ${u.nombre} - ${u.nit != null ? 'NIT: ${u.nit}' : 'CI: ${u.ci}'}',
                    compareFn: (Cliente a, Cliente b) => a.nombre == b.nombre,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Nombre del cliente',
                        hintText: 'Ingrese el nuevo nombre del cliente',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: TextFormField(
                    controller: nitController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'NIT del cliente',
                        hintText: 'Ingrese el nuevo NIT del cliente',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: TextFormField(
                    controller: ciController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'CI del cliente',
                        hintText: 'Ingrese el nuevo CI del cliente',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Teléfono del cliente',
                        hintText: 'Ingrese el nuevo teléfono del cliente',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 80,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ElevatedButton(
            onPressed: selectedClient != null
                ? () {
                    context.read<ListingCreateBloc>().add(SelectClient(
                          name: nameController.text,
                          nit: nitController.text,
                          ci: ciController.text,
                          phone: phoneController.text,
                          id: selectedClient!.id,
                        ));
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConst.blue,
            ),
            child: const Text(
              "Select",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
