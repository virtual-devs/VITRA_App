 import 'package:flutter/cupertino.dart';
import 'package:quickalert/quickalert.dart';

void showMesajeErroPostViajero(BuildContext context) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: 'Intente en un minuto',
    );
  }