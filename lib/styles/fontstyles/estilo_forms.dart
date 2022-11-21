import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';

abstract class EstiloLabelsFormulario {
  static const TextStyle titulo = TextStyle(
    fontSize: 28,
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w400,
    color: ColorsBase.colorprimario,
  );

  static const TextStyle de = TextStyle(
    fontSize: 28,
    fontFamily: 'Nunito Sans',
    fontWeight: FontWeight.w400,
    color: ColorsBase.colorsecundario,
  );

  static const TextStyle labelsprimarios = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static const TextStyle labeldate = TextStyle(
    fontFamily: 'Kameron',
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle labeltextboton = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle labelsprimariosunidades = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle labelsradiobox = TextStyle(
    fontFamily: 'Nunito',
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
}
