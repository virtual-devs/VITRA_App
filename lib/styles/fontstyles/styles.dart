import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colorsapp.dart';

abstract class StyleText {
  static const TextStyle estiloprimario = TextStyle(
      fontFamily: 'NunitoSans ', fontWeight: FontWeight.bold, fontSize: 20);

  static const TextStyle estilosecundario = TextStyle(
      fontFamily: 'NunitoSans ',
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: ColorsLetras.colorletraprimario);

  static const TextStyle historialestilo = TextStyle(
      fontFamily: 'NunitoSans',
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: ColorsLetras.colorletrasecundario);

  static const TextStyle estiloletracard = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: ColorsLetras.colorletrasecundario);

  static const TextStyle estilosearchletra = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.normal,
      fontSize: 13,
      color: ColorsLetras.colorletrasecundario);

  static const TextStyle estiloletrapreciocard = TextStyle(
      fontFamily: 'NunitoSans',
      fontWeight: FontWeight.bold,
      fontSize: 25,
      color: ColorsLetras.colorletrasecundario);

  static const TextStyle estiloletradia = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 8,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle estilorentatranpsorte = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle letracardrenta = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 17,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle letracardubicacion = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 8,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle estiloletracardrenta = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );
  static const TextStyle letraavisorenta = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 8,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle estiloletradetalle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle estilodetallesrenta = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle estilobotonrenta = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 15,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle estiloletrachatrenta = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );
}
