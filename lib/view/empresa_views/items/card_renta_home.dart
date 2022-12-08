import 'package:flutter/material.dart';
import 'package:vitrapp/util/convert_size.dart';

import '../../../styles/colors/colors_efects.dart';
import '../../../styles/colors/colors_input.dart';
import '../../../styles/fontstyles/estilo_cards.dart';

class CardRentaHome extends StatefulWidget {
  const CardRentaHome({super.key});

  @override
  State<CardRentaHome> createState() => _CardRentaHomeState();
}

class _CardRentaHomeState extends State<CardRentaHome> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SizedBox(
        width: convertWidth(width, 350),
        height: convertHeight(height, 220),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: convertWidth(width, 200),
                  height: convertHeight(height, 140),
                  decoration: const BoxDecoration(
                    color: ColorsInput.backgroundinput,
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 11,
                        offset: Offset(0, 5),
                        spreadRadius: -1,
                        color: ColorBlurEfect.blur,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: convertWidth(width, 180),
                        height: convertHeight(height, 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: convertWidth(width, 180),
                              child: const Text(
                                'Fecha de renta',
                                style: EstiloLabelsHomeEmpresa.primario,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        width: convertWidth(width, 180),
                        height: convertHeight(height, 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: convertWidth(width, 90),
                              child: const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  '22/10/2022',
                                  style: EstiloLabelsHomeEmpresa.secundarios,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: convertWidth(width, 180),
                        height: convertHeight(height, 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: convertWidth(width, 180),
                              child: const Text(
                                'Total de días',
                                style: EstiloLabelsHomeEmpresa.primario,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        width: convertWidth(width, 180),
                        height: convertHeight(height, 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: convertWidth(width, 60),
                              child: const Text(
                                '4',
                                textAlign: TextAlign.center,
                                style: EstilosCards.labelsecundarios,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: convertWidth(width, 180),
                        height: convertHeight(height, 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: convertWidth(width, 50),
                              height: convertHeight(height, 20),
                              child: const Text(
                                'Total',
                                style: EstiloLabelsHomeEmpresa.primario,
                              ),
                            ),
                            SizedBox(
                              width: convertWidth(width, 120),
                              height: convertHeight(height, 40),
                              child: const Text(
                                '400.00',
                                overflow: TextOverflow.ellipsis,
                                style: EstilosCards.labelprecio,
                              ),
                            ),
                          ],
                        ),
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
