import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';

void showMesajeOk(BuildContext context) {
  QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: '¡Se ha editado correctamente!',
       confirmBtnText: 'Aceptar',
      onConfirmBtnTap: (() {
        Navigator.pop(context);
        Navigator.pop(context);
      }));
}

void showMesajeOkRegistro(BuildContext context) {
  QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: '¡Se ha agregado correctamente!',
       confirmBtnText: 'Aceptar',
      onConfirmBtnTap: (() {
        Navigator.pop(context);
        Navigator.pop(context);
      }));
}
