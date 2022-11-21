import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colors_tab_bar.dart';
import 'package:vitrapp/view/viajero_views/Items/card_historial_renta.dart';
import 'package:vitrapp/view/viajero_views/Items/card_historial_viaje.dart';

class ViajeroHistorial extends StatefulWidget {
  const ViajeroHistorial({super.key});

  @override
  State<ViajeroHistorial> createState() => _ViajeroHistorialState();
}

class _ViajeroHistorialState extends State<ViajeroHistorial> {
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
                          child: CardHistorialRenta(),
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        SizedBox(
                          width: 350,
                          height: 644,
                          child: CardHistorialViaje(),
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
