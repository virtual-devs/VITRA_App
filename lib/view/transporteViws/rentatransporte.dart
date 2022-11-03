import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colorsapp.dart';
import 'package:vitrapp/styles/fontstyles/styles.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

class RentaTransporte extends StatelessWidget {
  const RentaTransporte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  SizedBox(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: ColorsLetras.colorletraprimario,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 50),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 4,
                              color: ColorBlurEffect.colorblur,
                              offset: Offset(2, 2),
                              spreadRadius: 3)
                        ]),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/taxi.jpg'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 28),
                    alignment: Alignment.center,
                    width: 200,
                    height: 100,
                    child: const Text(
                      'Renta de transporte Montecristo',
                      overflow: TextOverflow.fade,
                      style: StyleText.estilorentatranpsorte,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 250,
                  decoration: const BoxDecoration(
                    color: ColorsCard.backgroundcard,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 250,
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height: 170,
                                      child: Image.asset(
                                        'assets/images/urvan.png',
                                        alignment: Alignment.bottomCenter,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height: 80,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 4),
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: SvgPicture.asset(
                                                        'assets/icons/car.svg',
                                                        color: ColorsLetras
                                                            .colorletraprimario,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 4),
                                                  child: const Text(
                                                    'Nissan NV350',
                                                    style: StyleText
                                                        .letracardrenta,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  SizedBox(
                                                    width: 30,
                                                    height: 40,
                                                    child:
                                                        Icon(Icons.location_on),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                width: 110,
                                                child: const Text(
                                                  'Calle Segunda Pte. Nte. 342-2, Niño de Atocha, 29037 Tuxtla Gutiérrez, Chis.',
                                                  overflow: TextOverflow.fade,
                                                  style: StyleText
                                                      .letracardubicacion,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            height: 250,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: SvgPicture.asset(
                                              'assets/icons/asiento.svg',
                                              color: ColorsLetras
                                                  .colorletraprimario,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: const Text(
                                              '10',
                                              style: StyleText
                                                  .estiloletracardrenta,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 7, left: 1),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: SvgPicture.asset(
                                              'assets/icons/cambio.svg',
                                              color: ColorsLetras
                                                  .colorletraprimario,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: const Text(
                                              'Estandar',
                                              style: StyleText
                                                  .estiloletracardrenta,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 7, left: 1),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: SvgPicture.asset(
                                              'assets/icons/ac.svg',
                                              color: ColorsLetras
                                                  .colorletraprimario,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 15),
                                            child: const Text(
                                              'Si',
                                              style: StyleText
                                                  .estiloletracardrenta,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 13, top: 7),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                            height: 10,
                                            child: SvgPicture.asset(
                                              'assets/icons/peso.svg',
                                              color: ColorsLetras
                                                  .colorletrasecundario,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 20),
                                            child: const Text(
                                              '400.00',
                                              style: StyleText
                                                  .estiloletrapreciocard,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 22,
                                      margin: const EdgeInsets.only(left: 39),
                                      child: const Text(
                                        'Precio proporcionado es unicamente por día',
                                        overflow: TextOverflow.fade,
                                        style: StyleText.letraavisorenta,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 12),
                                      height: 50,
                                      width: 100,
                                      child: Image.asset(
                                          'assets/images/paypal.png'),
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
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, left: 60),
              child: Row(
                children: const [
                  Text(
                    'Detalles',
                    style: StyleText.estiloletradetalle,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 60),
              child: Row(children: [
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: ColorsCard.backgroundcard,
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                  ),
                  child: const SizedBox(
                    width: 280,
                    height: 80,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse ut metus. Proin venenatis turpis sit amet ante consequat semper. Aenean nunc. Duis iaculis odio id lectus. Integer dapibus justo vitae elit.Nunc luctus, tortor quis iaculis tempus, urna odio iaculis erat.',
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.fade,
                        style: StyleText.estilodetallesrenta,
                      ),
                    ),
                  ),
                )
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              width: 300,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15, top: 20),
                        width: 210,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: ColorsLetras.colorletraprimario),
                          onPressed: () {},
                          child: const Text(
                            'RENTAR Y PAGAR',
                            style: StyleText.estilobotonrenta,
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
                                backgroundImage:
                                    AssetImage('assets/images/whatsapp.png'),
                              ),
                            ),
                            const Text(
                              'Chat',
                              style: StyleText.estiloletrachatrenta,
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
    );
  }
}
