import 'package:flutter/material.dart';
import 'package:vitrapp/view/transporteViws/homeempresa.dart';
import 'package:vitrapp/view/transporteViws/hometransporte.dart';
import 'package:vitrapp/view/transporteViws/registroviajes.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> listaViews = [
      const RegistroViajes(),
      const HomeEmpresa(),
      const HomeTransporte(),
    ];
    return listaViews[index];
  }
}
