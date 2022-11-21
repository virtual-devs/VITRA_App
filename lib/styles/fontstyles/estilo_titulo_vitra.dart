import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';

abstract class EstiloTituloVitra {
  static const TextStyle letrasVIRA = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 40,
    color: ColorsBase.colorprimario,
    shadows: [
      Shadow(
        blurRadius: 10,
        color: ColorBlurEfect.blur,
        offset: Offset(0, 4),
      )
    ],
  );

  static const TextStyle letraT = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.bold,
    fontSize: 40,
    color: ColorsBase.colorsecundario,
    shadows: [
      Shadow(
        blurRadius: 10,
        color: ColorBlurEfect.blur,
        offset: Offset(0, 4),
      )
    ],
  );
  static const TextStyle subtitulo = TextStyle(
    fontFamily: 'NunitoSans',
    fontWeight: FontWeight.w800,
    fontSize: 20,
  );
}
