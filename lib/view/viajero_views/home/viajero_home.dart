import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/util/convert_size.dart';
import 'package:vitrapp/view/alerts/no_data_transporte.dart';
import 'package:vitrapp/view/viajero_views/Items/card_viajero_home_renta.dart';
import 'package:vitrapp/view/viajero_views/Items/card_viajero_home.dart';
import '../../../data/response/status.dart';
import '../../../styles/colors/colors_base.dart';
import '../../../styles/colors/colors_efects.dart';
import '../../../styles/colors/colors_input.dart';
import '../../../styles/fontstyles/estilo_home_viajero.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import '../../../view-model/viajero_view_model.dart';
import '../../login/login.dart';

class ViajeroHome extends StatefulWidget {
  const ViajeroHome({super.key});

  @override
  State<ViajeroHome> createState() => _ViajeroHomeState();
}

class _ViajeroHomeState extends State<ViajeroHome> {
  final storage = Hive.box('storage');
  bool mostrarPerfil = true;
  ViajeroViewModel viajeroViewModel = ViajeroViewModel();
  ViajeroViewModel x = ViajeroViewModel();
  DateTime fecha = DateTime.now();
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        mostrarPerfil = !mostrarPerfil;
      });
    });

    viajeroViewModel.vmGetTransportesHome();
    viajeroViewModel
        .vmGetViajesFechaHome('${fecha.year}-${fecha.month}-${fecha.day}');
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
                  width: convertWidth(width, 350),
                  height: convertHeight(height, 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: ColorsInput.backgroundinput,
                              boxShadow: [
                                BoxShadow(
                                  color: ColorBlurEfect.blur,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: (mostrarPerfil)
                                ? const CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                      'assets/images/avatar/avatar_viajero.png',
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      viajeroViewModel.vmLogout().then((value) {
                                        if (value.compareTo("200") == 0) {
                                          storage.clear();
                                          Route route = MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login());
                                          Navigator.push(context, route);
                                        } else {
                                          debugPrint("ERROR $value");
                                        }
                                      }).onError((error, stackTrace) {
                                        debugPrint(error.toString());
                                      });
                                    },
                                    icon: const Icon(
                                        CupertinoIcons.square_arrow_right)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: convertWidth(width, 350),
                        height: convertHeight(height, 100),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: convertWidth(width, 210),
                                  height: convertHeight(height, 100),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, right: 5),
                                            width: convertWidth(width, 150),
                                            height: convertHeight(height, 40),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                'Hola ${storage.get(1)}',
                                                style: EstiloLabelsHomeViajero
                                                    .saludo,
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            child: Image.asset(
                                              'assets/images/home_viajero/hv_saludo.png',
                                              width: convertWidth(width, 50),
                                              height: convertHeight(height, 50),
                                            ),
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: convertWidth(width, 350),
                      height: convertHeight(height, 50),
                      child: const Text(
                        'Viajes de hoy',
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
                      height: convertHeight(height, 300),
                      child: ChangeNotifierProvider<ViajeroViewModel>(
                        create: (context) => viajeroViewModel,
                        child: Consumer<ViajeroViewModel>(
                          builder: (context, value, _) {
                            switch (value.getViajesFechaResponse.status!) {
                              case Status.LOADING:
                                return const Center(
                                  child: CircularProgressIndicator(
                                      color: ColorsBase.colorsecundario),
                                );
                              case Status.COMPLETED:
                                return CardViajeroHome(
                                  listaViajes: value
                                      .getViajesFechaResponse.data!.results!,
                                );
                              case Status.ERROR:
                                return Center(
                                  child: Text(value
                                      .getViajesFechaResponse.message
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
                      width: convertWidth(width, 340),
                      height: convertHeight(height, 50),
                      child: const Text(
                        'Lo mas economico \nen rentas',
                        style: EstiloLabelsHomeViajero.encabezados2,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: convertWidth(width, 350),
                      height: convertHeight(height, 300),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: convertWidth(width, 350),
                            height: convertHeight(height, 300),
                            child:
                                ChangeNotifierProvider<ViajeroViewModel>.value(
                              value: viajeroViewModel,
                              child: Consumer<ViajeroViewModel>(
                                builder: (context, value, _) {
                                  switch (value
                                      .getTransportesHomeResponse.status!) {
                                    case Status.LOADING:
                                      return const Center(
                                        child: CircularProgressIndicator(
                                            color: ColorsBase.colorsecundario),
                                      );
                                    case Status.COMPLETED:
                                      return (value.getTransportesHomeResponse
                                                  .data!.results !=
                                              null)
                                          ? CardViajeroHomeRenta(
                                              listResults: (value
                                                  .getTransportesHomeResponse
                                                  .data!
                                                  .results!),
                                            )
                                          : nodatatransporte();
                                    case Status.ERROR:
                                      return Center(
                                        child: Text(value
                                            .getTransportesHomeResponse.message
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
