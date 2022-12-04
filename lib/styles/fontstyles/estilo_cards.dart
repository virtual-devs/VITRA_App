import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';

abstract class EstilosCards {
  static const TextStyle labeltitulo = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w800,
    fontSize: 15,
  );

  static const TextStyle labelsprimarios = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static const TextStyle labelsecundarios = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: ColorsBase.colorsecundario,
  );
  static const TextStyle labelprecio = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: ColorsBase.colorsecundario,
  );

  static const TextStyle labelsecundariocolor = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: ColorsBase.colorprimario,
  );
}

abstract class EstiloCardPresionada {
  static const TextStyle labelnombrempresa = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 20,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle labelmodelocar = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 17,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle labelubicacion = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle labelssimilares = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );

  static const TextStyle labelprecio = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 25,
    color: ColorsBase.colorprimario,
  );
  static const TextStyle labelaviso = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 8,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle labeldetalle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle labeltextodetalle = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle labeltextboton = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 15,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle labelchat = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 17,
  );
  static const TextStyle labeldiasrenta = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );
}

abstract class EstiloListCarsLabels {
  static const TextStyle primarios = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: ColorsBase.colorprimario,
  );
  static const TextStyle precio = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 25,
    color: ColorsBase.colorprimario,
  );
  static const TextStyle avisoprecio = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 8,
    fontWeight: FontWeight.w600,
  );
}

abstract class EstiloLabelsCardPresionadaViajes {
  static const TextStyle primarios = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w600,
    fontSize: 25,
  );
  static const TextStyle secundarios = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 23,
    color: ColorsBase.colorsecundario,
  );
  static const TextStyle precio = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 45,
    color: ColorsBase.colorsecundario,
  );
  static const TextStyle ubicacion = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: ColorsBase.colorprimario,
  );
  static const TextStyle asientos = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: ColorsBase.colorprimario,
  );
}

abstract class EstiloLabelsHomeEmpresa {
  static const TextStyle primario = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle secundarios = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: ColorsBase.colorsecundario,
  );
}

abstract class EstiloLabelsHistorial {
  static const TextStyle titulo = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle primario = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle secundarios = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: ColorsBase.colorsecundario,
  );
}
