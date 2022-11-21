import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import '../../../styles/colors/colors_efects.dart';
import '../../../styles/colors/colors_input.dart';
import '../../../styles/fontstyles/estilo_cards.dart';

class CardViajeroHomeRenta extends StatefulWidget {
  const CardViajeroHomeRenta({super.key});

  @override
  State<CardViajeroHomeRenta> createState() => _CardViajeroHomeRentaState();
}

class _CardViajeroHomeRentaState extends State<CardViajeroHomeRenta> {
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
                  width: 250,
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
                        color: ColorBlurEfect.blur,
                      )
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
                              width: 200,
                              child: const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  'Renta de transporte Montecristo',
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
                        width: 200,
                        height: 20,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 60,
                              child: Text(
                                'Nombre',
                                style: EstilosCards.labelsprimarios,
                              ),
                            ),
                            SizedBox(
                              width: 140,
                              child: Text(
                                'Fecha de renta',
                                textAlign: TextAlign.end,
                                style: EstilosCards.labelsprimarios,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        width: 200,
                        height: 20,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 90,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  'Erik Toledo Trinidad',
                                  style: EstilosCards.labelsecundarios,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: SingleChildScrollView(
                                child: Text(
                                  '22/10/2022',
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
                        width: 200,
                        height: 20,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Dias de renta',
                                style: EstilosCards.labelsprimarios,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        width: 200,
                        height: 20,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 100,
                              child: Text(
                                '3',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
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
                                '1500.00',
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
