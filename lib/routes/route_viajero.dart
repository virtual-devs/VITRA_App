import 'package:flutter/material.dart';
import 'package:vitrapp/view/viajero_views/home/viajero_home.dart';
//import 'package:vitrapp/view/transporteViws/hometransporte.dart';
import 'package:vitrapp/view/viajero_views/home/viajero_home_transportes.dart';
import 'package:vitrapp/view/viajero_views/home/viajero_home_viajes.dart';

import '../view/viajero_views/home/viajero_home_historial.dart';

class RouteViajero extends StatelessWidget {
  final int index;

  const RouteViajero({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> listaViews = [
      const ViajeroHomeViajes(),
      const ViajeroHomeTransporte(),
      const ViajeroHome(),
      const ViajeroHomeHistorial(),
    ];
    return listaViews[index];
  }
}
