import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

import '../../../styles/colors/colors_card.dart';
import '../../../styles/colors/colors_efects.dart';
import '../../../styles/fontstyles/estilo_cards.dart';

class CardViajesHome extends StatefulWidget {
  const CardViajesHome({super.key});

  @override
  State<CardViajesHome> createState() => _CardViajesHomeState();
}

class _CardViajesHomeState extends State<CardViajesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 350,
        height: 358,
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: (index != 4)
                      ? const EdgeInsets.only(left: 10, top: 10)
                      : const EdgeInsets.only(left: 10, top: 10, right: 10),
                  width: 270,
                  height: 200,
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
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 260,
                            margin: const EdgeInsets.only(top: 5),
                            child: const SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                'Viajes Tuxtla Gtz - Pichucalco',
                                textAlign: TextAlign.center,
                                style: EstilosCards.labeltitulo,
                                overflow: TextOverflow.ellipsis,
                              ),
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
                          Row(
                            children: [
                              SizedBox(
                                width: 135,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 18),
                                  child: const Text(
                                    'Tuxtla Gutierrez',
                                    overflow: TextOverflow.ellipsis,
                                    style: EstilosCards.labelsecundarios,
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
                                  child: const Text(
                                    '24/10/2022',
                                    style: EstilosCards.labelsecundarios,
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
                          children: [
                            SizedBox(
                              width: 90,
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 18),
                                    child: const Text(
                                      'Fecha',
                                      style: EstilosCards.labelsprimarios,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 90,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      'Hora',
                                      style: EstilosCards.labelsprimarios,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 75,
                              height: 40,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: const Text(
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.fade,
                                      'Asientos disp.',
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
                            width: 100,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 18),
                                  child: const Text(
                                    '26/11/2022',
                                    overflow: TextOverflow.ellipsis,
                                    style: EstilosCards.labelsecundarios,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '16:56',
                                  style: EstilosCards.labelsecundarios,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '3',
                                  style: EstilosCards.labelsecundarios,
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
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                      height: 10,
                                      child: SvgPicture.asset(
                                          'assets/icons/unidades/simbolo_peso.svg'),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      width: 100,
                                      height: 40,
                                      child: const Text(
                                        '300.00',
                                        style: EstilosCards.labelprecio,
                                      ),
                                    ),
                                  ],
                                )
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
      ),
    );
  }
}
