import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';

abstract class EstiloBarraBusqueda {
  static const TextStyle labelbarrabusqueda = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.normal,
    fontSize: 13,
    color: ColorsBase.colorprimario,
  );

  static const TextStyle labelfiltro = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: ColorsBase.colorprimario,
  );
}
