import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/styles/colors/colors_tab_bar.dart';
import 'package:vitrapp/view/viajero_views/Items/card_historial_renta.dart';
import 'package:vitrapp/view/viajero_views/Items/card_historial_viaje.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../styles/colors/colors_base.dart';
import '../../../view-model/viajero_view_model.dart';

class ViajeroHomeHistorial extends StatefulWidget {
  const ViajeroHomeHistorial({super.key});

  @override
  State<ViajeroHomeHistorial> createState() => _ViajeroHomeHistorialState();
}

class _ViajeroHomeHistorialState extends State<ViajeroHomeHistorial> {
  ViajeroViewModel viajeroViewModelHR = ViajeroViewModel();
  final storage = Hive.box('storage');
  final controllerAsientos = TextEditingController();
  @override
  void initState() {
    viajeroViewModelHR.vmGetHistorialRenta(
        "http://52.206.59.43/traveler/historialRE/", storage.get(5));
    viajeroViewModelHR.vmGetHistorialViaje(
        "http://52.206.59.43/traveler/historialRV/", storage.get(5));
    super.initState();
  }

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
                      children: [
                        SizedBox(
                          width: 350,
                          height: 600,
                          child: ChangeNotifierProvider<ViajeroViewModel>.value(
                            value: viajeroViewModelHR,
                            child: Consumer<ViajeroViewModel>(
                              builder: (context, value, _) {
                                switch (
                                    value.getHistorialRentaResponse.status!) {
                                  case Status.LOADING:
                                    return const Center(
                                      child: CircularProgressIndicator(
                                          color: ColorsBase.colorsecundario),
                                    );
                                  case Status.COMPLETED:
                                    return CardHistorialRenta(
                                        listResults: value
                                            .getHistorialRentaResponse
                                            .data!
                                            .results!);

                                  case Status.ERROR:
                                    return Center(
                                      child: Text(value
                                          .getHistorialRentaResponse.message
                                          .toString()),
                                    );
                                  case Status.INITIAL:
                                    return const Center(
                                      child: CircularProgressIndicator(
                                          backgroundColor:
                                              ColorsBase.colorsecundario),
                                    );
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 350,
                          height: 600,
                          child: ChangeNotifierProvider<ViajeroViewModel>.value(
                            value: viajeroViewModelHR,
                            child: Consumer<ViajeroViewModel>(
                              builder: (context, value, _) {
                                switch (
                                    value.getHistorialViajeResponse.status!) {
                                  case Status.LOADING:
                                    return const Center(
                                      child: CircularProgressIndicator(
                                          color: ColorsBase.colorsecundario),
                                    );
                                  case Status.COMPLETED:
                                    return CardHistorialViaje(
                                      listResults: value
                                          .getHistorialViajeResponse
                                          .data!
                                          .results!,
                                    );

                                  case Status.ERROR:
                                    return Center(
                                      child: Text(value
                                          .getHistorialViajeResponse.message
                                          .toString()),
                                    );
                                  case Status.INITIAL:
                                    return const Center(
                                      child: CircularProgressIndicator(
                                          backgroundColor:
                                              ColorsBase.colorsecundario),
                                    );
                                }
                              },
                            ),
                          ),
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
