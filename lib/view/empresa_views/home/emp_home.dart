// ignore: file_names

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vitrapp/util/convert_size.dart';

import '../../../data/response/status.dart';
import '../../../styles/colors/colors_base.dart';
import '../../../styles/colors/colors_efects.dart';
import '../../../styles/colors/colors_input.dart';
import '../../../styles/fontstyles/estilo_home_viajero.dart';
import '../../../view-model/viajero_view_model.dart';
import '../items/card_emp_historial_renta.dart';
import '../items/card_viaje.dart';

class HomeEmpresa extends StatefulWidget {
  const HomeEmpresa({super.key});

  @override
  State<HomeEmpresa> createState() => _HomeEmpresaState();
}

class _HomeEmpresaState extends State<HomeEmpresa> {
  final storage = Hive.box('storage');
  DateTime fecha = DateTime.now();
  ViajeroViewModel get = ViajeroViewModel();

  @override
  void initState() {
    get.vmGetViajesId(storage.get(5));
    get.vmGetHistorialRenta(
        "http://44.212.111.181/historialRE/", storage.get(5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: convertHeight(height, 70),
                  width: convertWidth(width, 350),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: ColorBlurEfect.blur,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 4),
                                  blurRadius: 8,
                                  color: ColorBlurEfect.blur,
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                'assets/images/avatar/avatar_empresa.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: convertWidth(width, 350),
                      height: convertHeight(height, 103),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: convertWidth(width, 246),
                                height: convertHeight(height, 102),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 10, right: 5),
                                          width: convertWidth(width, 190),
                                          height: convertHeight(height, 70),
                                          child: SingleChildScrollView(
                                            child: Text(
                                              '${storage.get(1)}',
                                              style: EstiloLabelsHomeViajero
                                                  .saludo,
                                              overflow: TextOverflow.fade,
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/home_viajero/hv_saludo.png',
                                          width: convertWidth(width, 50),
                                          height: convertHeight(height, 50),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: convertWidth(width, 200),
                                          height: convertHeight(height, 20),
                                          child: const Text(
                                            'Bienvenido a VITRA',
                                            style: EstiloLabelsHomeViajero
                                                .bienvenida,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: convertHeight(height, 50),
                      width: convertWidth(width, 350),
                      child: const Text(
                        'Algunas rentas',
                        style: EstiloLabelsHomeViajero.encabezados,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: convertWidth(width, 350),
                      height: convertHeight(height, 200),
                      child: ChangeNotifierProvider<ViajeroViewModel>.value(
                        value: get,
                        child: Consumer<ViajeroViewModel>(
                          builder: (context, value, _) {
                            switch (value.getHistorialRentaResponse.status!) {
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
                                        .results!,
                                    view: "home");

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
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: convertHeight(height, 40),
                      width: convertWidth(width, 350),
                      child: const Text(
                        'Viajes agregados',
                        style: EstiloLabelsHomeViajero.encabezados,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: convertWidth(width, 350),
                  height: convertHeight(height, 300),
                  child: ChangeNotifierProvider<ViajeroViewModel>(
                    create: (context) => get,
                    child: Consumer<ViajeroViewModel>(
                      builder: (context, value, _) {
                        switch (value.getViajesResponse.status!) {
                          case Status.LOADING:
                            return const Center(
                              child: CircularProgressIndicator(
                                color: ColorsBase.colorsecundario,
                              ),
                            );
                          case Status.COMPLETED:
                            return (value.getViajesResponse.data!.results !=
                                    null)
                                ? CardViaje(
                                    listViajes:
                                        value.getViajesResponse.data!.results!,
                                    delete: get,
                                    view: "home",
                                  )
                                : const Center(
                                    child:
                                        Text('No tiene ningun viaje agregado'));

                          case Status.ERROR:
                            return Center(
                              child: Text(
                                value.getViajesResponse.message.toString(),
                              ),
                            );
                          case Status.INITIAL:
                            return const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: ColorsBase.colorsecundario,
                              ),
                            );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
