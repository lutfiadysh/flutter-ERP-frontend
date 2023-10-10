import 'package:admin_dashboard/proy/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class OrderTable extends StatefulWidget {
  OrderTable(
      {Key? key,
      required this.productos,
      required this.date,
      required this.userName,
      required this.providerName,
      required this.providerPhone})
      : super(key: key);

  final List<ProductoDetalle> productos;
  final String userName;
  final String providerName;
  final String providerPhone;
  final DateTime date;

  @override
  State<OrderTable> createState() => _OrderTableState();
}

class _OrderTableState extends State<OrderTable> {
  late double total;

  @override
  void initState() {
    super.initState();
  }

  void updateProduct(int index, ProductoDetalle newProduct) {
    setState(() {
      widget.productos[index] = newProduct;
    });
  }

  void editProduct(int index, ProductoDetalle newProduct) {
    // Cambio aquí
    setState(() {
      widget.productos[index] = newProduct;
    });
  }

  final TextStyle _headerTextStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  final EdgeInsets _cellPadding = const EdgeInsets.all(8.0);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DateFormat dateFormatter = DateFormat('dd/MM/yyyy');
    final String fecha = dateFormatter.format(widget.date);
    final bool isDark = theme.brightness == Brightness.dark;
    List<ProductoDetalle> productos = widget.productos;

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
                    userName: widget.userName,
                    providerName: widget.providerName,
                    fecha: fecha,
                    // Nuevo campo
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text('Detalles del pedido:',
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
                    // Pasa la función aquí
                  ),
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
  final String userName;
  final String providerName;
  final String fecha;
  // Nuevo campo

  const HeaderSection({
    Key? key, // Corregido key
    required this.userName,
    required this.providerName,
    required this.fecha,
    // Nuevo campo
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Se añade InkWell para abrir el diálogo con un toque en cualquier parte de la sección

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Usuario: $userName'),
          const SizedBox(height: 10),
          Text('Proveedor: $providerName'),
          const SizedBox(height: 10), // Nuevo campo
          Text('Fecha: $fecha'),
          // El resto del código sigue igual
        ],
      ),
    );
  }
}

class ProductTable extends StatefulWidget {
  final List<ProductoDetalle> productos;
  final bool isLargeScreen;
  final bool isDark;
  final TextStyle headerTextStyle;
  final EdgeInsets cellPadding;
  final Function(int, ProductoDetalle) onEditProduct;

  const ProductTable({
    super.key,
    required this.productos,
    required this.isLargeScreen,
    required this.isDark,
    required this.headerTextStyle,
    required this.cellPadding,
    required this.onEditProduct,
  });

  @override
  State<ProductTable> createState() => _ProductTableState();
}

class _ProductTableState extends State<ProductTable> {
  void editProduct(int index) async {
    final producto = widget.productos[index];

    final updatedProducto = await showDialog<ProductoDetalle>(
      context: context,
      builder: (context) => EditProductDialog(
        producto: producto,
        totalCajas: producto.cantidadCajas,
      ),
    );

    if (updatedProducto != null) {
      widget.onEditProduct(index, updatedProducto);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
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
                  'Proveedor',
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
          ],
        ),
        ...widget.productos.asMap().entries.map<TableRow>((entry) {
          final index = entry.key;
          final producto = entry.value;

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
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: widget.cellPadding,
                  child: Text(
                    producto.producto?.proveedor?.nombre ?? 'N/A',
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: widget.cellPadding,
                  child: Text('${producto.cantidadCajas} cajas'),
                ),
              ),
            ],
          );
        }).toList(),
      ],
    );
  }
}

class EditProductDialog extends StatefulWidget {
  final ProductoDetalle producto;
  final int totalCajas; // Añade la cantidad total de cajas aquí
  // Añade la cantidad total de piezas aquí

  const EditProductDialog({
    super.key,
    required this.producto,
    required this.totalCajas,
  });

  @override
  _EditProductDialogState createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> {
  late TextEditingController _cajasController;

  @override
  void initState() {
    super.initState();
    _cajasController =
        TextEditingController(text: widget.producto.cantidadCajas.toString());
  }

  @override
  void dispose() {
    _cajasController.dispose();
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
            );
            Navigator.of(context).pop(updatedProducto);
          },
          child: const Text('Aceptar', style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }
}
