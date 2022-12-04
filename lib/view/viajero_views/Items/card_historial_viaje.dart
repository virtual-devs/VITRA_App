import 'package:flutter/material.dart';
import 'package:vitrapp/model/historial_viajes.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/fontstyles/estilo_cards.dart';

class CardHistorialViaje extends StatefulWidget {
  final List<ResultsHistorialViaje> listResults;
  const CardHistorialViaje({super.key, required this.listResults});

  @override
  State<CardHistorialViaje> createState() => _CardHistorialViajeState();
}

class _CardHistorialViajeState extends State<CardHistorialViaje> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.listResults.length,
        itemBuilder: (context, index) {
          ResultsHistorialViaje data = widget.listResults[index];
          return Column(
            children: [
              Container(
                margin: (index != 4)
                    ? const EdgeInsets.only(top: 10)
                    : const EdgeInsets.only(top: 10, bottom: 10),
                width: 270,
                height: 230,
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
                            '${data.nombreEmpresa}',
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
                            width: 135,
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
                            width: 135,
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
                              width: 135,
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
                              width: 135,
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
                              '${data.hora}',
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
                            width: 135,
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
                            width: 135,
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
                          width: 135,
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
                          width: 135,
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
                            width: 135,
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
                            width: 135,
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
                        Container(
                          width: 135,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${data.origen}',
                                overflow: TextOverflow.ellipsis,
                                style: EstilosCards.labelsecundariocolor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 135,
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
