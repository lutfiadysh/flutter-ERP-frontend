import 'package:admin_dashboard/proy/models/client.dart';
import 'package:admin_dashboard/proy/models/listing.dart';
import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListingTable extends StatefulWidget {
  const ListingTable({
    Key? key,
    required this.productos,
    required this.clientName,
    required this.clientNIT,
    required this.sellerName,
    required this.onClientNameChanged,
    required this.onClientNITChanged,
    required this.date,
    required this.onEditClient,
  }) : super(key: key);

  final List<ProductoElement> productos;
  final String sellerName;
  final String clientName;
  final String clientNIT;
  final ValueChanged<String> onClientNameChanged;
  final ValueChanged<String> onClientNITChanged;
  final ValueChanged<Cliente> onEditClient;
  final DateTime date;

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
                      onClientNITChanged: widget.onClientNITChanged),
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
                    onEditProduct: editProduct, // Pasa la función aquí
                  ),
                  const Divider(),
                  TotalSection(total: total),
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
  final String fecha;
  final Function(String) onClientNameChanged;
  final Function(String) onClientNITChanged;

  const HeaderSection(
      {super.key,
      required this.sellerName,
      required this.clientName,
      required this.clientNIT,
      required this.fecha,
      required this.onClientNameChanged,
      required this.onClientNITChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Cotización',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        Text('Creado por: $sellerName'),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text('Cliente: '),
            InkWell(
              onTap: () async {
                final newName = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => const ClientNameDialog(),
                );
                if (newName != null && newName.isNotEmpty) {
                  onClientNameChanged(newName);
                }
              },
              child: Text(clientName),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text('NIT: '),
            InkWell(
              onTap: () async {
                final newNIT = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => const ClientNITDialog(),
                );
                if (newNIT != null && newNIT.isNotEmpty) {
                  onClientNITChanged(newNIT);
                }
              },
              child: Text(clientNIT),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text('Fecha: $fecha'),
      ],
    );
  }
}

class ClientNameDialog extends StatelessWidget {
  const ClientNameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String? newClientName;
    return AlertDialog(
      title: const Text('Cambiar nombre del cliente'),
      content: TextField(
        onChanged: (value) {
          newClientName = value;
        },
        decoration: const InputDecoration(
          hintText: 'Ingrese el nuevo nombre del cliente',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(newClientName),
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}

class ClientNITDialog extends StatelessWidget {
  const ClientNITDialog({super.key});

  @override
  Widget build(BuildContext context) {
    String? newClientNIT;
    return AlertDialog(
      title: const Text('Cambiar NIT del cliente'),
      content: TextField(
        onChanged: (value) {
          newClientNIT = value;
        },
        decoration: const InputDecoration(
          hintText: 'Ingrese el nuevo NIT del cliente',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(newClientNIT),
          child: const Text('Aceptar'),
        ),
      ],
    );
  }
}

class ProductTable extends StatefulWidget {
  final List<ProductoElement> productos;
  final bool isLargeScreen;
  final bool isDark;
  final TextStyle headerTextStyle;
  final EdgeInsets cellPadding;
  final Function(int, ProductoElement) onEditProduct;

  const ProductTable({
    super.key,
    required this.productos,
    required this.isLargeScreen,
    required this.isDark,
    required this.headerTextStyle,
    required this.cellPadding,
    required this.onEditProduct, // Agrega esta línea
  });

  @override
  State<ProductTable> createState() => _ProductTableState();
}

class _ProductTableState extends State<ProductTable> {
  List<Stock> stocks = [];

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
        totalCajas: totalCajas, // Pasa la cantidad total de cajas
        totalPiezas: totalPiezas, // Pasa la cantidad total de piezas
      ),
    );

    if (updatedProducto != null) {
      widget.onEditProduct(index,
          updatedProducto); // Llama a la función de devolución de llamada aquí
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
                    child: Text(producto.producto?.nombre ?? 'N/A'),
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
}

class TotalSection extends StatelessWidget {
  final double total;

  const TotalSection({super.key, required this.total});

  @override
  Widget build(BuildContext context) {
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
  final int totalPiezas; // Añade la cantidad total de piezas aquí

  const EditProductDialog(
      {super.key,
      required this.producto,
      required this.totalCajas,
      required this.totalPiezas});

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
            );
            Navigator.of(context).pop(updatedProducto);
          },
          child: const Text('Aceptar', style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }
}
