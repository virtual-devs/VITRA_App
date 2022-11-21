import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';
import 'package:vitrapp/styles/fontstyles/estilo_cards.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

class CardViajeroHome extends StatefulWidget {
  const CardViajeroHome({super.key});

  @override
  State<CardViajeroHome> createState() => _CardViajeroHomeState();
}

class _CardViajeroHomeState extends State<CardViajeroHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SizedBox(
        width: 350,
        height: 200,
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
                  height: 160,
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
                          color: ColorBlurEfect.blur)
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: 180,
                              child: const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  'Viajes Tuxtla Gtz - Pichucalco',
                                  softWrap: false,
                                  maxLines: 1,
                                  style: EstilosCards.labeltitulo,
                                  overflow: TextOverflow.clip,
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
                              width: 90,
                              child: Text(
                                'Origen',
                                style: EstilosCards.labelsprimarios,
                              ),
                            ),
                            SizedBox(
                              width: 90,
                              child: Text(
                                'Destino',
                                textAlign: TextAlign.center,
                                style: EstilosCards.labelsprimarios,
                              ),
                            )
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
                                  'Tuxtla Gtz.',
                                  style: EstilosCards.labelsecundarios,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 90,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  'Pichucalco',
                                  textAlign: TextAlign.center,
                                  style: EstilosCards.labelsecundarios,
                                ),
                              ),
                            )
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
                              width: 60,
                              child: Text(
                                'Fecha',
                                style: EstilosCards.labelsprimarios,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Hora',
                                textAlign: TextAlign.center,
                                style: EstilosCards.labelsprimarios,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  'Asientos disponibles',
                                  overflow: TextOverflow.ellipsis,
                                  style: EstilosCards.labelsprimarios,
                                ),
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
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  '24/11/2022',
                                  overflow: TextOverflow.ellipsis,
                                  style: EstilosCards.labelsecundarios,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                '14:22',
                                textAlign: TextAlign.center,
                                style: EstilosCards.labelsecundarios,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                '2',
                                textAlign: TextAlign.center,
                                style: EstilosCards.labelsecundarios,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 180,
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                              height: 10,
                              child: SvgPicture.asset(
                                  'assets/icons/unidades/simbolo_peso.svg'),
                            ),
                            const SizedBox(
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
