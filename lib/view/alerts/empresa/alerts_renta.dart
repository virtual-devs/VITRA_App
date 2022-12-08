import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';

void showMensajeErrorPostRenta(BuildContext context, String codigo) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    confirmBtnText: 'Aceptar',
    title: 'Oops...',
    text: '¡Ha ocurrido un error: $codigo!',
  );
}

void showConfirmationRenta(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    title: 'Hecho',
    text: '¡Renta realizada exitosamente!',
    confirmBtnText: 'Aceptar',
    onConfirmBtnTap: () {
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );
}

void showMensajeCancelRenta(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.info,
    text: 'Su compra ha sido cancelada',
    title: '¡Atención!',
    confirmBtnText: 'Aceptar',
    onConfirmBtnTap: () {
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );
}
