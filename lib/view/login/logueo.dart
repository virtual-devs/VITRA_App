import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickalert/quickalert.dart';
import 'package:vitrapp/view/empresa_views/emp_home_page.dart';
import 'package:vitrapp/view/viajero_views/viajero_home_page.dart';

String parseoLogin(String email, String password) =>
    jsonEncode({"email": email, "password": password});

bool validarLogin(String username, String password) =>
    (username.isNotEmpty && password.isNotEmpty) ? true : false;

void showMesajeErrorLogin(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: 'Correo o contraseña incorrecta',
  );
}

void showMesajeErrorLoginE(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: 'Intentalo de nuevo en 1 minuto',
  );
}

void showMesajeErrorLoginCampos(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: 'Revisa los campos',
  );
}

void fromJson(dynamic body) {
  for (var element in body) {
    debugPrint(element.toString());
  }
}

void routes(BuildContext context, String rol) {
  loading(context);
  Timer(const Duration(seconds: 5), () {
    if (rol.compareTo('viajero') == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ViajeroHomePage(),
        ),
      );
    } else if (rol.compareTo('arrendador') == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const EmpresaHomePage(),
        ),
      );
    }
  });
}

void loading(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.loading,
    title: 'Iniciando sesión',
  );
}

String headers() {
  final storage = Hive.box('storage');
  return storage.get(2).toString();
}
