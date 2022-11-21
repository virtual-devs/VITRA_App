import 'package:flutter/material.dart';
import 'package:vitrapp/view/empresa_views/items/card_emp_historial_renta.dart';
import 'package:vitrapp/view/empresa_views/items/card_emp_historial_viaje.dart';

import '../../styles/colors/colors_tab_bar.dart';

class EmpresaHistorial extends StatefulWidget {
  const EmpresaHistorial({super.key});

  @override
  State<EmpresaHistorial> createState() => _EmpresaHistorialState();
}

class _EmpresaHistorialState extends State<EmpresaHistorial> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const TabBar(
                indicatorColor: ColorTabBar.indicatorcolor,
                unselectedLabelColor: ColorTabBar.background,
                labelColor: ColorTabBar.label,
                tabs: [
                  Tab(
                    text: 'Renta',
                  ),
                  Tab(
                    text: 'Viajes',
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Column(
                      children: const [
                        SizedBox(
                          width: 350,
                          height: 644,
                          child: CardEmpresaHistorialRenta(),
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        SizedBox(
                          width: 350,
                          height: 644,
                          child: CardEmpresaHistorialViaje(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
