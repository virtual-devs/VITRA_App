import 'package:flutter/material.dart';
import 'package:vitrapp/view/empresa_views/home/emp_home_perfil.dart';

//import 'package:vitrapp/view/transporteViws/hometransporte.dart';

import '../view/empresa_views/home/emp_home_historial.dart';
import '../view/empresa_views/home/emp_home.dart';
import '../view/empresa_views/home/emp_home_transporte.dart';
import '../view/empresa_views/home/empresa_home_viajes.dart';

class RouteEmpresa extends StatelessWidget {
  final int index;

  const RouteEmpresa({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> listaViews = const [
      EmpresaHomeViaje(),
      EmpresaHomeTransporte(),
      HomeEmpresa(),
      EmpresaHomeHistorial(),
      EmpresaPerfil(),
    ];
    return listaViews[index];
  }
}
