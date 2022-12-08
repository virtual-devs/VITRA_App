import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';

void showMesajeErrorViajero(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
     confirmBtnText: 'Aceptar',
    title: 'Oops...',
    text: 'Los campos no pueden quedar vacios\n El 0 es un numero no valido',
  );
}
