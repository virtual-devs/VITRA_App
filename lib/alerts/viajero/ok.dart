import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';

void showMesajeOkViajero(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    text: 'Viaje agregado exitosamente!',
    onConfirmBtnTap: (() {
      Navigator.pop(context);
      Navigator.pop(context);
    }),
  );
}
