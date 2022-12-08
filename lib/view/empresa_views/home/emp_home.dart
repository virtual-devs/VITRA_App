// ignore: file_names

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/util/convert_size.dart';
import 'package:vitrapp/view/empresa_views/items/card_renta_home.dart';

import '../../../styles/colors/colors_efects.dart';
import '../../../styles/colors/colors_input.dart';
import '../../../styles/fontstyles/estilo_home_viajero.dart';
import '../items/card_viajes_home.dart';

class HomeEmpresa extends StatefulWidget {
  const HomeEmpresa({super.key});

  @override
  State<HomeEmpresa> createState() => _HomeEmpresaState();
}

class _HomeEmpresaState extends State<HomeEmpresa> {
  final storage = Hive.box('storage');
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
                        'Rentas de hoy',
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
                      child: const CardRentaHome(),
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
                      height: convertHeight(height, 220),
                      child: const CardViajesHome(),
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
