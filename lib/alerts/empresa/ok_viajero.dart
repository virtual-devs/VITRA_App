import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';

void showMesajeOk(BuildContext context) {
  QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: '¡Se ha editado correctamente!',
      onConfirmBtnTap: (() {
        Navigator.pop(context);
        Navigator.pop(context);
      }));
}
