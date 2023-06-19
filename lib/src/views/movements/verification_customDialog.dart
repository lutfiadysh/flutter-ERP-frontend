import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:admin_dashboard/proy/services/notification_service.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

class MovementDetailsDialog extends StatelessWidget {
  final Movimiento movimiento;

  const MovementDetailsDialog({Key? key, required this.movimiento})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movementsProvider = Provider.of<MovementsProvider>(context);

    initializeDateFormatting('es', null);
    Intl.defaultLocale = 'es';
    var dateFormat = DateFormat.yMMMMd('es');

    var now = DateTime.now();

    String timeAgo = '';

    // Calculate the difference between the current time and the movement time
    Duration difference = now.difference(movimiento.fecha);

    // Show a message based on the difference in time
    if (difference.inSeconds < 60) {
      timeAgo = 'Hace instantes';
    } else if (difference.inMinutes < 60) {
      timeAgo = 'Hace ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      timeAgo = 'Hace ${difference.inHours} hr';
    } else {
      timeAgo = 'Hace ${difference.inDays} días';
    }

    Widget _buildText(String text, TextStyle style) {
      return Text(
        text,
        style: style,
      );
    }

    TextStyle _subTitleStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );

    TextStyle _dataStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.access_time, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    timeAgo,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              VerificationBadge(
                verificationStatus: movimiento.verificacion,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          ListTile(
            title: Text(
              movimiento.stock.producto.nombre,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                _buildText('Cantidad de cajas:', _subTitleStyle),
                _buildText(movimiento.cantidadCajas.toString(), _dataStyle),
                const SizedBox(height: 8),
                _buildText('Cantidad de piezas:', _subTitleStyle),
                _buildText(movimiento.cantidadPiezas.toString(), _dataStyle),
                const SizedBox(height: 8),
                _buildText('Creado por:', _subTitleStyle),
                _buildText(movimiento.usuario.nombre, _dataStyle),
                const SizedBox(height: 8),
                _buildText('Verificación:', _subTitleStyle),
                _buildText(movimiento.verificacion.toString(), _dataStyle),
                const Divider(),
                _buildText('Verificado por:', _subTitleStyle),
                _buildText(
                    movimiento.verificadoPor?.nombre ?? 'N/A', _dataStyle),
                const SizedBox(height: 8),
                _buildText('Fecha de verificación:', _subTitleStyle),
                _buildText(
                  movimiento.fecha_verificacion != null
                      ? dateFormat.format(movimiento.fecha_verificacion!)
                      : 'N/A',
                  _dataStyle,
                ),
              ],
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () async {
                  // Aquí puedes agregar la lógica para verificar el movimiento
                  try {
                    if (movimiento.movimiento == 'ENTRADA') {
                      await movementsProvider.updateMovementInput(
                          id: movimiento.id);
                    } else if (movimiento.movimiento == 'SALIDA') {
                      await movementsProvider.updateMovementOutput(
                          id: movimiento.id);
                    } else {
                      throw Exception('Tipo de movimiento desconocido');
                    }

                    Navigator.pop(context);
                    NotificationsService.showSnackbar('Movimiento actualizado');
                  } catch (e) {
                    print("Error al actualizar el movimiento: $e");
                    NotificationsService.showSnackbar(
                        'Error al actualizar el movimiento');
                  }
                },
                child: const Text(
                  'VERIFICAR',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'CERRAR',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VerificationBadge extends StatelessWidget {
  final String verificationStatus;

  const VerificationBadge({Key? key, required this.verificationStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color badgeColor;
    switch (verificationStatus) {
      case 'EN ESPERA':
        badgeColor = ColorConst.warning;
        break;
      case 'VERIFICADO':
        badgeColor = ColorConst.success;
        break;
      case 'ERROR':
        badgeColor = ColorConst.error;
        break;
      default:
        badgeColor = ColorConst.primary;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        verificationStatus,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
