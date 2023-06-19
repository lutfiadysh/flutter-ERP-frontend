import 'package:admin_dashboard/proy/models/listing.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  double calculateTotal() {
    double total = 0;
    for (ProductoElement producto in widget.productos) {
      final totalCajas =
          producto.cantidadCajas * producto.producto!.precioCaja!;
      final totalPiezas =
          producto.cantidadPiezas * producto.producto!.precioPorUnidad!;
      final totalFinal = totalCajas + totalPiezas;
      total += totalFinal;
    }
    return total;
  }

  void _showProductDetailsDialog(
      BuildContext context, ProductoElement producto) {
    final formKey = GlobalKey<FormState>();
    int cantidadCajas = producto.cantidadCajas;
    int cantidadPiezas = producto.cantidadPiezas;
    double precioCaja = producto.producto!.precioCaja!;
    double precioUnidad = producto.producto!.precioPorUnidad!;

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
                  // Contenido integrado del _buildProductDetailsDialogContent
                  Text('Nombre: ${producto.producto!.nombre}'),
                  TextFormField(
                    initialValue: '$cantidadCajas',
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: 'Cantidad de cajas'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese un número válido';
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
                    decoration:
                        const InputDecoration(labelText: 'Cantidad de piezas'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese un número válido';
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
                  // Fin del contenido integrado
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Elimina el producto y actualiza el estado.
                          setState(() {
                            widget.productos.remove(producto);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('Eliminar',
                            style: TextStyle(color: Colors.red)),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            // Actualiza el producto en la lista de productos
                            int index = widget.productos.indexOf(producto);
                            setState(() {
                              widget.productos[index].cantidadCajas =
                                  cantidadCajas;
                              widget.productos[index].cantidadPiezas =
                                  cantidadPiezas;
                              widget.productos[index].producto!.precioCaja =
                                  precioCaja;
                              widget.productos[index].producto!
                                  .precioPorUnidad = precioUnidad;
                            });

                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text('Guardar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DateFormat dateFormatter = DateFormat('dd/MM/yyyy');
    final String fecha = dateFormatter.format(widget.date);
    final bool isDark = theme.brightness == Brightness.dark;

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cotización',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text('Creado por: ${widget.sellerName}'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text('Cliente: '),
                          InkWell(
                            onTap: () async {
                              final newName = await showDialog<String>(
                                context: context,
                                builder: (BuildContext context) {
                                  String? newClientName;
                                  return AlertDialog(
                                    title: const Text(
                                        'Cambiar nombre del cliente'),
                                    content: TextField(
                                      onChanged: (value) {
                                        newClientName = value;
                                      },
                                      decoration: const InputDecoration(
                                        hintText:
                                            'Ingrese el nuevo nombre del cliente',
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.of(context)
                                            .pop(newClientName),
                                        child: const Text('Aceptar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (newName != null && newName.isNotEmpty) {
                                widget.onClientNameChanged(newName);
                              }
                            },
                            child: Text(widget.clientName),
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
                                builder: (BuildContext context) {
                                  String? newClientNIT;
                                  return AlertDialog(
                                    title:
                                        const Text('Cambiar NIT del cliente'),
                                    content: TextField(
                                      onChanged: (value) {
                                        newClientNIT = value;
                                      },
                                      decoration: const InputDecoration(
                                        hintText:
                                            'Ingrese el nuevo NIT del cliente',
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.of(context)
                                            .pop(newClientNIT),
                                        child: const Text('Aceptar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (newNIT != null && newNIT.isNotEmpty) {
                                widget.onClientNITChanged(newNIT);
                              }
                            },
                            child: Text(widget.clientNIT),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('Fecha: $fecha'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text('Detalles de la cotización:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Table(
                    columnWidths: {
                      0: const FlexColumnWidth(1),
                      1: const FlexColumnWidth(1),
                      if (isLargeScreen) 2: const FlexColumnWidth(1),
                      if (isLargeScreen) 3: const FlexColumnWidth(1),
                      4: const FlexColumnWidth(1),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Producto',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Cantidad',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          if (isLargeScreen)
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Precio Caja',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          if (isLargeScreen)
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Precio Unidad',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Sub-Total',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          if (isLargeScreen)
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Diferencia %',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      ...widget.productos.map<TableRow>((producto) {
                        final totalCajas = producto.cantidadCajas *
                            producto.producto!.precioCaja!;
                        final totalPiezas = producto.cantidadPiezas *
                            producto.producto!.precioPorUnidad!;
                        final totalFinal = totalCajas + totalPiezas;

                        final precioCajaOriginal =
                            producto.producto!.precioCaja!;
                        final precioCajaActual = producto.precioUnitarioCajas;
                        final diferenciaCaja =
                            ((precioCajaActual - precioCajaOriginal) /
                                    precioCajaOriginal) *
                                100;

                        final precioUnidadOriginal =
                            producto.producto!.precioPorUnidad!;
                        final precioUnidadActual =
                            producto.precioUnitarioPiezas;
                        final diferenciaUnidad =
                            ((precioUnidadActual - precioUnidadOriginal) /
                                    precioUnidadOriginal) *
                                100;

                        return TableRow(
                          children: [
                            TableCell(
                              child: InkWell(
                                onTap: () {
                                  _showProductDetailsDialog(context, producto);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(producto.producto!.nombre),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    '${producto.cantidadCajas} cajas, ${producto.cantidadPiezas} piezas'),
                              ),
                            ),
                            if (isLargeScreen)
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Text('${producto.producto!.precioCaja}'),
                                ),
                              ),
                            if (isLargeScreen)
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      '${producto.producto!.precioPorUnidad}'),
                                ),
                              ),
                            TableCell(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('$totalFinal'),
                              ),
                            ),
                            if (isLargeScreen)
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Caja: ${diferenciaCaja.toStringAsFixed(2)}%, Unidad: ${diferenciaUnidad.toStringAsFixed(2)}%',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          isDark ? Colors.white : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Total: ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${calculateTotal()}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
