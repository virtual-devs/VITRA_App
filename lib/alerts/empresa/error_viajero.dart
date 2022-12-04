// ignore: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void showMesajeError(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: 'Los campos no pueden quedar vacios',
  );
}
