import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';

void showConfirmation(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    title: 'Hecho',
    text: '¡Tu compra se ha realizado exitosamente!',
    confirmBtnText: 'Aceptar',
    onConfirmBtnTap: () {
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );
}

void showMensajeErrorPost(BuildContext context, String codigo) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: '¡Ha ocurrido un error: $codigo!',
    confirmBtnText: 'Aceptar',
    onConfirmBtnTap: () {
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );
}

void showMensajeCancelCompra(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.info,
    text: 'Su compra ha sido cancelada',
    title: 'Atención',
    confirmBtnText: 'Aceptar',
    onConfirmBtnTap: () {
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );
}
