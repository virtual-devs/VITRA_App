import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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

class ViajeroHome extends StatefulWidget {
  const ViajeroHome({super.key});

  @override
  State<ViajeroHome> createState() => _ViajeroHomeState();
}

class _ViajeroHomeState extends State<ViajeroHome> {
  final storage = Hive.box('storage');
  ViajeroViewModel viajeroViewModel = ViajeroViewModel();
  ViajeroViewModel x = ViajeroViewModel();
  DateTime fecha = DateTime(2022, 11, 21);
  @override
  void initState() {
    viajeroViewModel.vmGetTransportesHome();
    viajeroViewModel
        .vmGetViajesFechaHome('${fecha.year}-${fecha.month}-${fecha.day}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                  width: 350,
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
                                  color: ColorBlurEfect.blur,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                )
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                'assets/images/avatar/avatar_viajero.png',
                              ),
                            ),
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
                        width: 350,
                        height: 100,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: 210,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 10, right: 5),
                                            width: 150,
                                            height: 40,
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
                                              width: 50,
                                              height: 50,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          SizedBox(
                                            width: 200,
                                            height: 20,
                                            child: Text(
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
                  children: const [
                    SizedBox(
                      height: 50,
                      width: 350,
                      child: Text(
                        'Viajes proximos',
                        style: EstiloLabelsHomeViajero.encabezados,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 350,
                      height: 300,
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
                  children: const [
                    SizedBox(
                      height: 50,
                      width: 340,
                      child: Text(
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
                      width: 350,
                      height: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 350,
                            height: 300,
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
