import 'package:admin_dashboard/proy/models/listing.dart';
import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/proy/models/user.dart';
import 'package:admin_dashboard/proy/providers/auth_provider.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListingTable extends StatefulWidget {
  ListingTable({
    Key? key,
    required this.productos,
    required this.clientName,
    required this.clientNIT,
    required this.sellerName,
    required this.onClientNameChanged,
    required this.onClientNITChanged,
    required this.date,
  }) : super(key: key);

  final List<ProductoElement> productos;
  final String sellerName;
  final String clientName;
  final String clientNIT;
  final ValueChanged<String> onClientNameChanged;
  final ValueChanged<String> onClientNITChanged;
  final DateTime date;

  @override
  State<ListingTable> createState() => _ListingTableState();
}

class _ListingTableState extends State<ListingTable> {
  final TextStyle _headerTextStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  final EdgeInsets _cellPadding = EdgeInsets.all(8.0);

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
                    onProductChanged: (updatedProductos) {
                      setState(() {
                        productos = updatedProductos;
                      });
                    },
                  ),
                  const Divider(),
                  TotalSection(total: calculateTotal(productos)),
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

  HeaderSection(
      {required this.sellerName,
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
                  builder: (BuildContext context) => ClientNameDialog(),
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
                  builder: (BuildContext context) => ClientNITDialog(),
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
  final Function(List<ProductoElement>) onProductChanged;

  ProductTable({
    required this.productos,
    required this.isLargeScreen,
    required this.isDark,
    required this.headerTextStyle,
    required this.cellPadding,
    required this.onProductChanged,
  });

  @override
  State<ProductTable> createState() => _ProductTableState();
}

class _ProductTableState extends State<ProductTable> {
  List<Stock> stocks = [];

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
    final userFormProvider = Provider.of<AuthProvider>(context);
    final user = userFormProvider.user!;

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
        ...widget.productos.map<TableRow>((producto) {
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
                  onTap: () {
                    showProductDetailsDialog(
                        context: context,
                        producto: producto,
                        productos: widget.productos,
                        onProductUpdated: (updatedProductos, updatedProducto) {
                          // Llama al callback para notificar al widget padre
                          widget.onProductChanged(updatedProductos);
                        },
                        stocks: stocks,
                        user: user);
                  },
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

  TotalSection({required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Total: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('${total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

Future<void> showProductDetailsDialog({
  required BuildContext context,
  required ProductoElement producto,
  required Function(List<ProductoElement>, ProductoElement) onProductUpdated,
  required List<ProductoElement> productos,
  required List<Stock> stocks,
  required Usuario user,
}) async {
  final formKey = GlobalKey<FormState>();
  int cantidadCajas = producto.cantidadCajas;
  int cantidadPiezas = producto.cantidadPiezas;
  double precioCaja = producto.precioUnitarioCajas;
  double precioUnidad = producto.precioUnitarioPiezas;

  // Aquí necesitamos obtener la cantidad total de cajas y piezas en stock para este producto
  int totalCajasStockSucursal =
      getStock(false, producto.producto!.id, stocks, user.sucursal.id);
  int totalPiezasStockSucursal =
      getStock(true, producto.producto!.id, stocks, user.sucursal.id);
  int totalCajasStock = getStock(false, producto.producto!.id, stocks, null);
  int totalPiezasStock = getStock(true, producto.producto!.id, stocks, null);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Nombre: ${producto.producto!.nombre}'),
                TextFormField(
                  initialValue: '$cantidadCajas',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Cantidad de cajas',
                    // Mostrar el stock disponible en la sucursal y en total
                    helperText:
                        'Sucursal: $totalCajasStockSucursal, Total: $totalCajasStock',
                  ),
                  validator: (value) {
                    int newValue = int.tryParse(value!) ?? 0;
                    if (value.isEmpty || newValue > totalCajasStockSucursal) {
                      return 'Por favor, ingrese un número válido y que no exceda el stock disponible en la sucursal';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    cantidadCajas = int.parse(newValue!);
                  },
                ),
                TextFormField(
                  initialValue: '$cantidadPiezas',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Cantidad de piezas',
                    // Mostrar el stock disponible en la sucursal y en total
                    helperText:
                        'Sucursal: $totalPiezasStockSucursal, Total: $totalPiezasStock',
                  ),
                  validator: (value) {
                    int newValue = int.tryParse(value!) ?? 0;
                    if (value.isEmpty || newValue > totalPiezasStockSucursal) {
                      return 'Por favor, ingrese un número válido y que no exceda el stock disponible en la sucursal';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    cantidadPiezas = int.parse(newValue!);
                  },
                ),
                TextFormField(
                  initialValue: '$precioCaja',
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Precio por caja'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese un número válido';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    precioCaja = double.parse(newValue!);
                  },
                ),
                TextFormField(
                  initialValue: '$precioUnidad',
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Precio por unidad'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese un número válido';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    precioUnidad = double.parse(newValue!);
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                final updatedProducto = producto.copyWith(
                  cantidadCajas: cantidadCajas,
                  cantidadPiezas: cantidadPiezas,
                  precioUnitarioCajas: precioCaja,
                  precioUnitarioPiezas: precioUnidad,
                );

                onProductUpdated(productos, updatedProducto);
                Navigator.of(context).pop();
              }
            },
            child: const Text('Guardar'),
          ),
        ],
      );
    },
  );
}

// Esta es la función que obtiene el total de cajas o piezas en stock para un producto en específico
int getStock(
    bool isPiezas, String productId, List<Stock> stocks, String? sucursalId) {
  int total = 0;

  for (var stock in stocks) {
    if (stock.producto.id == productId &&
        (sucursalId == null || stock.sucursal.id == sucursalId)) {
      total += isPiezas ? stock.cantidadPiezas ?? 0 : stock.cantidadCajas ?? 0;
    }
  }

  return total;
}
