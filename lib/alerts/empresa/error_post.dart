import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';

void showMesajeErrorPost(BuildContext context) {
  QuickAlert.show(
    context: context,
    confirmBtnText: 'Aceptar',
    type: QuickAlertType.error,
    title: 'Oops...',
    text: 'Verifique que los datos sean correctos',
  );
}
