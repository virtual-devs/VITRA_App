import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  static TextStyle vi = GoogleFonts.nunitoSans(
      fontSize: 45,
      color: ColorsBase.colorprimario,
      fontWeight: FontWeight.w800,
      shadows: const [
        Shadow(
          blurRadius: 10,
          offset: Offset(0, 4),
          color: ColorBlurEfect.blur,
        )
      ]);
  static TextStyle t = GoogleFonts.nunitoSans(
      fontSize: 45,
      color: ColorsBase.colorsecundario,
      fontWeight: FontWeight.w800,
      shadows: const [
        Shadow(
          blurRadius: 10,
          offset: Offset(0, 4),
          color: ColorBlurEfect.blur,
        )
      ]);

  static TextStyle subtituloSplash = GoogleFonts.montserrat(
    fontSize: 13,
    color: ColorsBase.colorprimario,
    fontWeight: FontWeight.w400,
  );
}
