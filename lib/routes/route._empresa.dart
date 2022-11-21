import 'package:flutter/material.dart';
import 'package:vitrapp/view/empresa_views/emp_historial.dart';
import 'package:vitrapp/view/empresa_views/emp_home.dart';
import 'package:vitrapp/view/empresa_views/emp_home_transporte.dart';
//import 'package:vitrapp/view/transporteViws/hometransporte.dart';

import '../view/empresa_views/empresa_home_viajes.dart';
import '../view/empresa_views/registro_views/emp_registro_unidades.dart';

class RouteEmpresa extends StatelessWidget {
  final int index;

  const RouteEmpresa({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> listaViews = const [
      EmpresaHomeViaje(),
      EmpresaHomeTransporte(),
      HomeEmpresa(),
      EmpresaHistorial(),
      RegistroUnidades(),
    ];
    return listaViews[index];
  }
}
