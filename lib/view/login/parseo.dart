import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

String parseo(String username, String password, String email, String rol) {
  return jsonEncode(
      {"username": username, "password": password, "email": email, "rol": rol});
}

bool validar(
  String username,
  String password,
  String email,
) =>
    (username.isNotEmpty && password.isNotEmpty && email.isNotEmpty)
        ? true
        : false;

void showMesajePerfilAgregado(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    text: 'Perfil agregado exitosamente!',
    onConfirmBtnTap: (() {
      Navigator.pop(context);
      Navigator.pop(context);
    }),
  );
}

void showMesajeErrorRegistro(BuildContext context, String code) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: 'Error $code espera 1 minuto',
  );
}

void showMesajeErrorCamposRegistro(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: 'Revisa tus campos',
  );
}

void showMesajeErroPostRegistro(BuildContext context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Oops...',
    text: 'Intente en un minuto',
  );
}

bool emailValido(String email) => EmailValidator.validate(email);
