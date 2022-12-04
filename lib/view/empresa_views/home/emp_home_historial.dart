import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vitrapp/view/empresa_views/items/card_emp_historial_renta.dart';
import 'package:vitrapp/view/empresa_views/items/card_emp_historial_viaje.dart';

import '../../../data/response/status.dart';
import '../../../styles/colors/colors_base.dart';
import '../../../styles/colors/colors_tab_bar.dart';
import '../../../view-model/viajero_view_model.dart';

class EmpresaHomeHistorial extends StatefulWidget {
  const EmpresaHomeHistorial({super.key});

  @override
  State<EmpresaHomeHistorial> createState() => _EmpresaHomeHistorialState();
}

class _EmpresaHomeHistorialState extends State<EmpresaHomeHistorial> {
  ViajeroViewModel viewModel = ViajeroViewModel();
  final storage = Hive.box('storage');
  @override
  void initState() {
    viewModel.vmGetHistorialRenta(
        "http://44.212.111.181/historialRE/", storage.get(5));
    viewModel.vmGetHistorialViaje(
        "http://44.212.111.181/historialRV/", storage.get(5));
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
                            value: viewModel,
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
                                    return CardEmpresaHistorialRenta(
                                        listHistorial: value
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
                            value: viewModel,
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
                                    return CardEmpresaHistorialViaje(
                                      listViajes: value
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
