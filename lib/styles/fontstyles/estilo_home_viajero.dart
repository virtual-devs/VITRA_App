import 'package:flutter/cupertino.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';

abstract class EstiloLabelsHomeViajero {
  static const TextStyle saludo = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 30,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        blurRadius: 12,
        color: ColorBlurEfect.blur,
        offset: Offset(0, 4),
      )
    ],
  );
  static const TextStyle bienvenida = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle encabezados = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle encabezados2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle fecha = TextStyle(
    fontFamily: 'Kameron',
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
