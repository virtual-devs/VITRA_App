import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class EstiloLabelsRegistro {
  static TextStyle avisoPrimario = GoogleFonts.nunitoSans(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: const Color.fromRGBO(126, 137, 156, 1),
  );
  static TextStyle avisoSecundario = GoogleFonts.nunitoSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color.fromRGBO(221, 83, 80, 1),
  );
  static TextStyle viajero = GoogleFonts.nunitoSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color.fromRGBO(126, 137, 156, 1),
  );
  static TextStyle titulo = GoogleFonts.nunitoSans(
    fontSize: 40,
    fontWeight: FontWeight.w800,
    color: const Color.fromRGBO(255, 255, 255, 1),
  );
}
