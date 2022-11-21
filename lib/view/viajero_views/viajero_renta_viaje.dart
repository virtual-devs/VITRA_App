import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';
import 'package:vitrapp/styles/fontstyles/estilo_cards.dart';

import '../../styles/colors/colors_base.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

class ViajeroRentaViaje extends StatefulWidget {
  const ViajeroRentaViaje({super.key});

  @override
  State<ViajeroRentaViaje> createState() => _ViajeroRentaViajeState();
}

class _ViajeroRentaViajeState extends State<ViajeroRentaViaje> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  height: 40,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: ColorsBase.colorsecundario,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 80,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: FileImage(
                                File(''),
                              ),
                              radius: 40,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 270,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 180,
                                  height: 80,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Viajes Tuxtla Gtz - Pichucalco',
                                    textAlign: TextAlign.center,
                                    style:
                                        EstiloCardPresionada.labelnombrempresa,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 350,
                  height: 250,
                  margin: const EdgeInsets.only(top: 30),
                  decoration: const BoxDecoration(
                    color: ColorsCard.backgroundcardpresionada,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 320,
                        height: 30,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                'Origen',
                                style:
                                    EstiloLabelsCardPresionadaViajes.primarios,
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                'Destino',
                                textAlign: TextAlign.center,
                                style:
                                    EstiloLabelsCardPresionadaViajes.primarios,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 320,
                        height: 30,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                'Tuxtla Gtz',
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                'Pichucalco',
                                textAlign: TextAlign.center,
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 310,
                        height: 30,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 150,
                              height: 30,
                              child: Text(
                                'Fecha',
                                style:
                                    EstiloLabelsCardPresionadaViajes.primarios,
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                'Hora',
                                textAlign: TextAlign.center,
                                style:
                                    EstiloLabelsCardPresionadaViajes.primarios,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 320,
                        height: 30,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                '22/11/2022',
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                '14:00',
                                textAlign: TextAlign.center,
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 310,
                        height: 30,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 100,
                              height: 30,
                              child: SingleChildScrollView(
                                child: Text(
                                  'Asientos disp.',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  style: EstiloLabelsCardPresionadaViajes
                                      .primarios,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 320,
                        height: 80,
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 80,
                              child: const Text(
                                '3',
                                textAlign: TextAlign.center,
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: 10,
                              height: 20,
                              child: SvgPicture.asset(
                                'assets/icons/unidades/simbolo_peso.svg',
                                height: 15,
                                width: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 150,
                              height: 70,
                              child: Text(
                                '200.00',
                                textAlign: TextAlign.center,
                                style: EstiloLabelsCardPresionadaViajes.precio,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 350,
                  height: 70,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                        child: Icon(
                          Icons.location_on,
                        ),
                      ),
                      SizedBox(
                        width: 320,
                        height: 100,
                        child: Text(
                          'Calle Segunda Pte. Nte. 342-2, Niño de Atocha, 29037 Tuxtla Gutiérrez, Chis.'
                              .toUpperCase(),
                          style: EstiloLabelsCardPresionadaViajes.ubicacion,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 350,
                  height: 90,
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 350,
                        child: Text(
                          '¿ # de asientos a comprar?',
                          style: EstiloLabelsCardPresionadaViajes.asientos,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 350,
                        height: 60,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '0 es un numero no valido',
                            hintStyle: const TextStyle(
                              color: ColorsInput.hinttext,
                            ),
                            filled: true,
                            fillColor: ColorsInput.backgroundinput,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: const BorderSide(
                                  color: ColorsInput.borderinput),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 350,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: 275,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: ColorsBase.colorsecundario),
                              onPressed: () {},
                              child: const Text(
                                'RENTAR Y PAGAR',
                                style: EstiloCardPresionada.labeltextboton,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        'assets/images/card_pressed/cp_default_chat.png'),
                                  ),
                                ),
                                const Text(
                                  'Chat',
                                  style: EstiloCardPresionada.labelchat,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
