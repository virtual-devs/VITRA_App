import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/model/historial_viajes.dart';
import 'package:vitrapp/util/convert_size.dart';

import '../../../styles/colors/colors_card.dart';
import '../../../styles/colors/colors_efects.dart';
import '../../../styles/fontstyles/estilo_cards.dart';

class CardEmpresaHistorialViaje extends StatefulWidget {
  final List<ResultsHistorialViaje> listViajes;
  const CardEmpresaHistorialViaje({super.key, required this.listViajes});

  @override
  State<CardEmpresaHistorialViaje> createState() =>
      _CardEmpresaHistorialViajeState();
}

class _CardEmpresaHistorialViajeState extends State<CardEmpresaHistorialViaje> {
  final storage = Hive.box('storage');
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.listViajes.length,
        itemBuilder: (context, index) {
          ResultsHistorialViaje data = widget.listViajes[index];
          return Column(
            children: [
              Container(
                margin: (index != 4)
                    ? const EdgeInsets.only(top: 10)
                    : const EdgeInsets.only(top: 10, bottom: 10),
                width: convertWidth(width, 270),
                height: convertHeight(height, 250),
                decoration: const BoxDecoration(
                    color: ColorsCard.background,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 11,
                        color: ColorBlurEfect.blur,
                        offset: Offset(0, 5),
                        spreadRadius: -1,
                      )
                    ]),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Text(
                            '${storage.get(1)}',
                            style: EstilosCards.labeltitulo,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: convertWidth(width, 135),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 18),
                                  child: const Text(
                                    'Nombre',
                                    style: EstilosCards.labelsprimarios,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: convertWidth(width, 135),
                            child: Row(
                              children: const [
                                Text(
                                  'Fecha de compra',
                                  style: EstilosCards.labelsprimarios,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: convertWidth(width, 135),
                              child: Container(
                                margin: const EdgeInsets.only(left: 18),
                                child: Text(
                                  '${data.nombre}',
                                  overflow: TextOverflow.ellipsis,
                                  style: EstilosCards.labelsecundariocolor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: convertWidth(width, 135),
                              child: Container(
                                margin: const EdgeInsets.only(left: 18),
                                child: Text(
                                  '${data.fecha}',
                                  style: EstilosCards.labelsecundariocolor,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Hora de compra',
                                style: EstilosCards.labelsecundariocolor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${data.fecha}',
                              overflow: TextOverflow.ellipsis,
                              style: EstilosCards.labelsecundariocolor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: convertWidth(width, 135),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 18),
                                  child: const Text(
                                    'Fecha de salida',
                                    style: EstilosCards.labelsprimarios,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: convertWidth(width, 135),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const Text(
                                    'Hora de salida',
                                    style: EstilosCards.labelsprimarios,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: convertWidth(width, 135),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 18),
                                child: Text(
                                  '${data.fechaSalida}',
                                  overflow: TextOverflow.ellipsis,
                                  style: EstilosCards.labelsecundariocolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: convertWidth(width, 135),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${data.horaSalida}',
                                style: EstilosCards.labelsecundariocolor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          SizedBox(
                            width: convertWidth(width, 135),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 18),
                                  child: const Text(
                                    'Origen',
                                    style: EstilosCards.labelsprimarios,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: convertWidth(width, 135),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Destino',
                                  style: EstilosCards.labelsprimarios,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: convertWidth(width, 135),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 18),
                                child: Text(
                                  '${data.origen}',
                                  overflow: TextOverflow.ellipsis,
                                  style: EstilosCards.labelsecundariocolor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: convertWidth(width, 135),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${data.destino}',
                                overflow: TextOverflow.ellipsis,
                                style: EstilosCards.labelsecundariocolor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: convertWidth(width, 120),
                      height: convertHeight(height, 30),
                      child: Text(
                        '\$${data.total}.00',
                        style: EstilosCards.labelprecio,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
