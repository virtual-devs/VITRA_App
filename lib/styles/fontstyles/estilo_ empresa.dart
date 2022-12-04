// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';

abstract class EstiloLabelsUnidades {
  static const TextStyle titulo = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textoboton = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
}

abstract class EstiloAlert {
  static const TextStyle textoAlerta = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ColorsInput.backgroundinput,
  );
}
