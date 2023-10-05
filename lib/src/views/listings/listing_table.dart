import 'package:admin_dashboard/proy/models/client.dart';
import 'package:admin_dashboard/proy/models/listing.dart';
import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/proy/providers/clients_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListingTable extends StatefulWidget {
  ListingTable(
      {Key? key,
      required this.productos,
      required this.clientName,
      required this.clientNIT,
      required this.sellerName,
      required this.onClientNameChanged,
      required this.onClientNITChanged,
      required this.date,
      required this.onEditClient,
      required this.clientCI,
      required this.onClientCIChanged,
      required this.onEnouchStockChanged,
      required this.total,
      required this.clienteID,
      required this.onCheckStock,
      required this.onClientPhoneChanged,
      required this.clientPhone})
      : super(key: key);

  final double total;
  final List<ProductoElement> productos;
  final String sellerName;
  final String clientName;
  final String clientNIT;
  final String clientCI;
  final String clientPhone;
  final String clienteID; // Nuevo campo
  final ValueChanged<String> onClientNameChanged;
  final ValueChanged<String> onClientNITChanged;
  final ValueChanged<String> onClientCIChanged;
  final ValueChanged<String> onClientPhoneChanged; // Nuevo campo
  final ValueChanged<String> onEditClient;
  final ValueChanged<bool> onEnouchStockChanged;
  final DateTime date;
  final Function(List<ProductoElement>) onCheckStock;

  @override
  State<ListingTable> createState() => _ListingTableState();
}

class _ListingTableState extends State<ListingTable> {
  late double total;

  @override
  void initState() {
    super.initState();
    total = calculateTotal(widget.productos);
  }

  void updateProduct(int index, ProductoElement newProduct) {
    setState(() {
      widget.productos[index] = newProduct;
      total = calculateTotal(widget.productos); // Recalcular el total
    });
  }

  void editProduct(int index, ProductoElement newProduct) {
    // Cambio aquí
    setState(() {
      widget.productos[index] = newProduct;
      total = calculateTotal(widget.productos); // Recalcular el total
    });
  }

  final TextStyle _headerTextStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  final EdgeInsets _cellPadding = const EdgeInsets.all(8.0);

  double calculateTotal(List<ProductoElement> productos) {
    return productos.fold(0, (double total, ProductoElement producto) {
      final totalCajas =
          producto.cantidadCajas * (producto.precioUnitarioCajas);
      final totalPiezas =
          producto.cantidadPiezas * (producto.precioUnitarioPiezas);
      return total + totalCajas + totalPiezas;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DateFormat dateFormatter = DateFormat('dd/MM/yyyy');
    final String fecha = dateFormatter.format(widget.date);
    final bool isDark = theme.brightness == Brightness.dark;
    List<ProductoElement> productos = widget.productos;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              bool isLargeScreen = constraints.maxWidth > 600;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderSection(
                    sellerName: widget.sellerName,
                    clientName: widget.clientName,
                    clientNIT: widget.clientNIT,
                    fecha: fecha,
                    onClientNameChanged: widget.onClientNameChanged,
                    onClientNITChanged: widget.onClientNITChanged,
                    clientCI: widget.clientCI,
                    onClientCIChanged: widget.onClientCIChanged,
                    clientPhone: widget.clientPhone, // Nuevo campo
                    onClientPhoneChanged:
                        widget.onClientPhoneChanged, // Nuevo campo
                    onEditClient: widget.onEditClient,
                    clientID: widget.clienteID, // Nuevo campo
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text('Detalles de la cotización:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  ProductTable(
                    productos: productos,
                    isLargeScreen: isLargeScreen,
                    isDark: isDark,
                    headerTextStyle: _headerTextStyle,
                    cellPadding: _cellPadding,
                    onEditProduct: editProduct,
                    onEnoughStockChanged: widget.onEnouchStockChanged,
                    // Pasa la función aquí
                  ),
                  const Divider(),
                  TotalSection(productos: productos),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final String sellerName;
  final String clientName;
  final String clientNIT;
  final String clientCI;
  final String clientPhone; // Nuevo campo
  final String clientID; // Nuevo campo
  final String fecha;
  final ValueChanged<String> onClientNameChanged; // Cambiado a ValueChanged
  final ValueChanged<String> onClientNITChanged; // Cambiado a ValueChanged
  final ValueChanged<String> onClientCIChanged;
  final ValueChanged<String> onClientPhoneChanged; // Nuevo campo
  final ValueChanged<String> onEditClient; // Nuevo campo

  const HeaderSection({
    Key? key, // Corregido key
    required this.sellerName,
    required this.clientName,
    required this.clientNIT,
    required this.clientCI, // Nuevo campo
    required this.fecha,
    required this.onClientNameChanged,
    required this.onClientNITChanged,
    required this.onClientCIChanged,
    required this.onClientPhoneChanged, // Nuevo campo
    required this.onEditClient,
    required this.clientID,
    required this.clientPhone, // Nuevo campo
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Se añade InkWell para abrir el diálogo con un toque en cualquier parte de la sección
      onTap: () async {
        final clientData = await showDialog<Map<String, String>>(
          context: context,
          builder: (BuildContext context) => ClientDataDialog(
            newClientName: clientName,
            newClientNIT: clientNIT,
            newClientCI: clientCI,
            newClientPhone: clientPhone, // Nuevo campo
            newClientID: clientID, // Nuevo campo
          ),
        );
        if (clientData != null) {
          onClientNameChanged(clientData['name']!);
          onClientNITChanged(clientData['nit']!);
          onClientCIChanged(clientData['ci']!);
          onClientPhoneChanged(clientData['phone']!); // Nuevo campo
          onEditClient(clientData['id']!); // Nuevo campo
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Vendedor: $sellerName'),
          const SizedBox(height: 10),
          Text('Cliente: $clientName'),
          const SizedBox(height: 10),
          Text('NIT: $clientNIT'),
          const SizedBox(height: 10),
          Text('CI: $clientCI'), // Nuevo campo
          const SizedBox(height: 10),
          Text('Teléfono: $clientPhone'), // Nuevo campo
          const SizedBox(height: 10),
          Text('Fecha: $fecha'),
          // El resto del código sigue igual
        ],
      ),
    );
  }
}

class ClientDataDialog extends StatefulWidget {
  final String newClientName;
  final String newClientNIT;
  final String newClientCI;
  final String newClientPhone; // Nuevo campo
  final String newClientID; // Nuevo campo

  ClientDataDialog({
    required this.newClientName,
    required this.newClientNIT,
    required this.newClientCI,
    required this.newClientID,
    required this.newClientPhone,
  });

  @override
  _ClientDataDialogState createState() => _ClientDataDialogState();
}

class _ClientDataDialogState extends State<ClientDataDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nitController = TextEditingController();
  TextEditingController ciController = TextEditingController();
  TextEditingController phoneController =
      TextEditingController(); // Nuevo campo
  TextEditingController idController = TextEditingController(); // Nuevo campo
  Cliente? selectedClient;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.newClientName;
    nitController.text = widget.newClientNIT;
    ciController.text = widget.newClientCI;
    phoneController.text = widget.newClientPhone; // Nuevo campo
    idController.text = widget.newClientID; // Nuevo campo
  }

  @override
  Widget build(BuildContext context) {
    final clientsProvider =
        Provider.of<ClientsProvider>(context, listen: false);

    return FutureBuilder<List<Cliente>>(
      future: clientsProvider.getClients(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AlertDialog(
            content: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color:
                    Theme.of(context).primaryColor, // Color primario de tu tema
                shape: BoxShape.circle, // Forma redonda
              ),
              child: const Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white), // Color del indicador
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.transparent, // Fondo transparente
            elevation: 0, // Sin sombra
          );
        } else if (snapshot.hasError) {
          return const AlertDialog(
            content: Text('Ocurrió un error al cargar los datos.'),
          );
        } else {
          final clientes = snapshot.data ?? [];
          return AlertDialog(
            title: const Text('Actualizar datos del cliente'),
            content: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownSearch<Cliente>(
                      popupProps: const PopupProps.menu(
                        showSelectedItems: true,
                        showSearchBox: true,
                      ),
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Cliente",
                          hintText: "Seleccione un cliente",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      items: clientes,
                      onChanged: (Cliente? cliente) {
                        setState(() {
                          selectedClient = cliente;
                          if (selectedClient != null) {
                            nameController.text = selectedClient!.nombre;
                            nitController.text =
                                selectedClient!.nit ?? 'Sin NIT';
                            ciController.text = selectedClient!.ci ?? 'Sin CI';
                            idController.text = selectedClient!.id;
                          }
                        });
                      },
                      selectedItem: selectedClient,
                      itemAsString: (Cliente u) =>
                          'Nombre: ${u.nombre}- NIT: ${u.nit} - CI: ${u.ci}',
                      compareFn: (Cliente a, Cliente b) => a.nombre == b.nombre,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre del cliente',
                        hintText: 'Ingrese el nuevo nombre del cliente',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: nitController,
                      decoration: const InputDecoration(
                        labelText: 'NIT del cliente',
                        hintText: 'Ingrese el nuevo NIT del cliente',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: ciController,
                      decoration: const InputDecoration(
                        labelText: 'CI del cliente',
                        hintText: 'Ingrese el nuevo CI del cliente',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: phoneController, // Nuevo campo
                      decoration: const InputDecoration(
                        labelText: 'Teléfono del cliente', // Nuevo campo
                        hintText: 'Ingrese el nuevo teléfono del cliente',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop({
                  'name': nameController.text,
                  'nit': nitController.text,
                  'ci': ciController.text,
                  'phone': phoneController.text, // Nuevo campo
                  'id': idController.text, // Nuevo campo
                }),
                child: const Text('Aceptar'),
              ),
            ],
          );
        }
      },
    );
  }
}

class ProductTable extends StatefulWidget {
  final List<ProductoElement> productos;
  final bool isLargeScreen;
  final bool isDark;
  final TextStyle headerTextStyle;
  final EdgeInsets cellPadding;
  final ValueChanged<bool> onEnoughStockChanged; // Agrega esta línea
  final Function(int, ProductoElement) onEditProduct;

  const ProductTable(
      {super.key,
      required this.productos,
      required this.isLargeScreen,
      required this.isDark,
      required this.headerTextStyle,
      required this.cellPadding,
      required this.onEditProduct,
      required this.onEnoughStockChanged // Agrega esta línea
      });

  @override
  State<ProductTable> createState() => _ProductTableState();
}

class _ProductTableState extends State<ProductTable> {
  List<Stock> stocks = [];
  bool enoughStock = true;

  int getTotalCajas(String productoId) {
    return stocks.where((stock) => stock.producto.id == productoId).fold(
        0, (int total, Stock stock) => total + (stock.cantidadCajas ?? 0));
  }

  int getTotalPiezas(String productoId) {
    return stocks.where((stock) => stock.producto.id == productoId).fold(
        0, (int total, Stock stock) => total + (stock.cantidadPiezas ?? 0));
  }

  void editProduct(int index) async {
    final producto = widget.productos[index];
    final totalCajas = getTotalCajas(producto.producto?.id ?? '');
    final totalPiezas = getTotalPiezas(producto.producto?.id ?? '');

    final updatedProducto = await showDialog<ProductoElement>(
      context: context,
      builder: (context) => EditProductDialog(
        producto: producto,
        totalCajas: totalCajas,
        totalPiezas: totalPiezas,
      ),
    );

    if (updatedProducto != null) {
      widget.onEditProduct(index, updatedProducto);
    }

    if (totalCajas >= updatedProducto!.cantidadCajas &&
        totalPiezas >= updatedProducto.cantidadPiezas) {
      widget.onEnoughStockChanged(true);
    } else {
      widget.onEnoughStockChanged(false);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final stocksProvider =
          Provider.of<StocksProvider>(context, listen: false);
      stocksProvider.getStocks().then((value) {
        setState(() {
          stocks = stocksProvider.stocks;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: const FlexColumnWidth(1),
        1: const FlexColumnWidth(1),
        if (widget.isLargeScreen) 2: const FlexColumnWidth(1),
        if (widget.isLargeScreen) 3: const FlexColumnWidth(1),
        4: const FlexColumnWidth(1),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: widget.cellPadding,
                child: Text(
                  'Producto',
                  style: widget.headerTextStyle.copyWith(
                    color: widget.isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: widget.cellPadding,
                child: Text(
                  'Cantidad',
                  style: widget.headerTextStyle.copyWith(
                    color: widget.isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            if (widget.isLargeScreen)
              TableCell(
                child: Padding(
                  padding: widget.cellPadding,
                  child: Text(
                    'Precio Caja',
                    style: widget.headerTextStyle.copyWith(
                      color: widget.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            if (widget.isLargeScreen)
              TableCell(
                child: Padding(
                  padding: widget.cellPadding,
                  child: Text(
                    'Precio Unidad',
                    style: widget.headerTextStyle.copyWith(
                      color: widget.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            TableCell(
              child: Padding(
                padding: widget.cellPadding,
                child: Text(
                  'Sub-Total',
                  style: widget.headerTextStyle.copyWith(
                    color: widget.isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            if (widget.isLargeScreen)
              TableCell(
                child: Padding(
                  padding: widget.cellPadding,
                  child: Text(
                    'Diferencia %',
                    style: widget.headerTextStyle.copyWith(
                      color: widget.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
          ],
        ),
        ...widget.productos.asMap().entries.map<TableRow>((entry) {
          final index = entry.key;
          final producto = entry.value;
          final precioCajaOriginal = producto.producto?.precioCaja ?? 0;
          final precioCajaActual = producto.precioUnitarioCajas;
          final diferenciaCaja =
              ((precioCajaActual - precioCajaOriginal) / precioCajaOriginal) *
                  100;
          final totalCajas = producto.cantidadCajas * (precioCajaActual);
          final totalPiezas = producto.cantidadPiezas *
              (producto.producto?.precioPorUnidad ?? 0);
          final totalFinal = totalCajas + totalPiezas;
          final precioUnidadOriginal = producto.producto?.precioPorUnidad ?? 0;
          final precioUnidadActual = producto.precioUnitarioPiezas;
          final diferenciaUnidad =
              ((precioUnidadActual - precioUnidadOriginal) /
                      precioUnidadOriginal) *
                  100;

          return TableRow(
            children: [
              TableCell(
                child: InkWell(
                  onTap: () =>
                      editProduct(index), // Llamar a editProduct cuando se toca
                  child: Padding(
                    padding: widget.cellPadding,
                    child: Text(
                      producto.producto?.nombre ?? 'N/A',
                      style: TextStyle(
                        color: suficientesProductosEnStock(
                                producto.producto!.id,
                                producto.cantidadCajas,
                                producto
                                    .cantidadPiezas) // Función que debes implementar
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: widget.cellPadding,
                  child: Text(
                      '${producto.cantidadCajas} cajas, ${producto.cantidadPiezas} piezas'),
                ),
              ),
              if (widget.isLargeScreen)
                TableCell(
                  child: Padding(
                    padding: widget.cellPadding,
                    child: Text('${producto.producto?.precioCaja ?? 'N/A'}'),
                  ),
                ),
              if (widget.isLargeScreen)
                TableCell(
                  child: Padding(
                    padding: widget.cellPadding,
                    child:
                        Text('${producto.producto?.precioPorUnidad ?? 'N/A'}'),
                  ),
                ),
              TableCell(
                child: Padding(
                  padding: widget.cellPadding,
                  child: Text('$totalFinal'),
                ),
              ),
              if (widget.isLargeScreen)
                TableCell(
                  child: Padding(
                    padding: widget.cellPadding,
                    child: Text(
                      'Caja: ${diferenciaCaja.toStringAsFixed(2)}%, Unidad: ${diferenciaUnidad.toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: widget.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          );
        }).toList(),
      ],
    );
  }

  bool suficientesProductosEnStock(
      String productoId, int cantidadCajas, int cantidadPiezas) {
    // Aquí debes definir la lógica que determina si hay suficientes productos en el stock.
    int totalCajas = getTotalCajas(productoId);
    int totalPiezas = getTotalPiezas(productoId);

    // Este es un ejemplo, debes ajustar los números según tus necesidades.
    if (totalCajas >= cantidadCajas && totalPiezas >= cantidadPiezas) {
      return true;
    }

    return false;
  }
}

class TotalSection extends StatefulWidget {
  final List<ProductoElement> productos;

  const TotalSection({Key? key, required this.productos}) : super(key: key);

  @override
  State<TotalSection> createState() => _TotalSectionState();
}

class _TotalSectionState extends State<TotalSection> {
  double calculateTotal(List<ProductoElement> productos) {
    return productos.fold(0, (double total, ProductoElement producto) {
      final totalCajas =
          producto.cantidadCajas * (producto.precioUnitarioCajas);
      final totalPiezas =
          producto.cantidadPiezas * (producto.precioUnitarioPiezas);
      return total + totalCajas + totalPiezas;
    });
  }

  @override
  Widget build(BuildContext context) {
    final total = calculateTotal(widget.productos);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Total: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(total.toStringAsFixed(2), style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class EditProductDialog extends StatefulWidget {
  final ProductoElement producto;
  final int totalCajas; // Añade la cantidad total de cajas aquí
  final int totalPiezas;
  // Añade la cantidad total de piezas aquí

  const EditProductDialog({
    super.key,
    required this.producto,
    required this.totalCajas,
    required this.totalPiezas,
  });

  @override
  _EditProductDialogState createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> {
  late TextEditingController _cajasController;
  late TextEditingController _piezasController;
  late TextEditingController _precioCajasController;
  late TextEditingController _precioPiezasController;

  @override
  void initState() {
    super.initState();
    _cajasController =
        TextEditingController(text: widget.producto.cantidadCajas.toString());
    _piezasController =
        TextEditingController(text: widget.producto.cantidadPiezas.toString());
    _precioCajasController = TextEditingController(
        text: widget.producto.precioUnitarioCajas.toString());
    _precioPiezasController = TextEditingController(
        text: widget.producto.precioUnitarioPiezas.toString());
  }

  @override
  void dispose() {
    _cajasController.dispose();
    _piezasController.dispose();
    _precioCajasController.dispose();
    _precioPiezasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.edit, color: Colors.blue),
          SizedBox(width: 8),
          Text('Editar Producto', style: TextStyle(color: Colors.blue)),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            TextField(
              controller: _cajasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cantidad de Cajas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _piezasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cantidad de Piezas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _precioCajasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Precio por Caja',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _precioPiezasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Precio por Pieza',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar', style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: () {
            final updatedProducto = widget.producto.copyWith(
              cantidadCajas: int.parse(_cajasController.text),
              cantidadPiezas: int.parse(_piezasController.text),
              precioUnitarioCajas: double.parse(_precioCajasController.text),
              precioUnitarioPiezas: double.parse(_precioPiezasController.text),
              precioTotalPiezas: int.parse(_piezasController.text) *
                  double.parse(_precioPiezasController.text),
              precioTotalCajas: int.parse(_cajasController.text) *
                  double.parse(_precioCajasController.text),
              precioTotal: (int.parse(_cajasController.text) *
                      double.parse(_precioCajasController.text)) +
                  (int.parse(_piezasController.text) *
                      double.parse(_precioPiezasController.text)),
            );
            Navigator.of(context).pop(updatedProducto);
          },
          child: const Text('Aceptar', style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }
}
