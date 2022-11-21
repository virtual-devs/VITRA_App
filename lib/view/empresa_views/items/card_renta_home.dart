import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SizedBox(
        width: 350,
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  width: 200,
                  height: 140,
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
                        width: 180,
                        height: 20,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 180,
                              child: Text(
                                'Fecha de renta',
                                style: EstiloLabelsHomeEmpresa.primario,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        width: 180,
                        height: 20,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 90,
                              child: SingleChildScrollView(
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
                        width: 180,
                        height: 20,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 180,
                              child: Text(
                                'Total de días',
                                style: EstiloLabelsHomeEmpresa.primario,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        width: 180,
                        height: 20,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 60,
                              child: Text(
                                '4',
                                textAlign: TextAlign.center,
                                style: EstilosCards.labelsecundarios,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: 50,
                              height: 30,
                              child: const Text(
                                'Total',
                                style: EstiloLabelsHomeEmpresa.primario,
                              ),
                            ),
                            const SizedBox(
                              width: 120,
                              height: 40,
                              child: Text(
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
