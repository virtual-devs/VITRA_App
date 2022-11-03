import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colorsapp.dart';
import 'package:vitrapp/styles/fontstyles/styles.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrapp/view/transporteViws/rentatransporte.dart';

class HomeTransporte extends StatelessWidget {
  const HomeTransporte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text(
                          '¡Renta ',
                          style: StyleText.estiloprimario,
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          'un ',
                          style: StyleText.estilosecundario,
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        Text(
                          'transporte!',
                          style: StyleText.estiloprimario,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 350,
                    decoration: const BoxDecoration(
                        color: ColorsInput.colorinput,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: ColorBlurEffect.colorblur,
                            offset: Offset(3, 3),
                          ),
                        ]),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          width: 40,
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.search,
                                color: ColorsLetras.colorletraprimario,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: const [
                            SizedBox(
                              width: 290,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Ingresa un modelo',
                                  hintStyle: StyleText.estilosearchletra,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 34),
                              height: 40,
                              width: 40,
                              child: SvgPicture.asset(
                                'assets/icons/garage.svg',
                                color: ColorsLetras.colorletraprimario,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 10),
                              child: InkWell(
                                onTap: () {},
                                child: const Text(
                                  'Historial de transporte rentado',
                                  style: StyleText.historialestilo,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: 350,
                    height: 400,
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                        color: ColorBackgroundList.colorbackground,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: ColorBlurEffect.colorblur,
                            offset: Offset(4, 4),
                          ),
                        ]),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => const RentaTransporte());
                            Navigator.push(context, route);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 170,
                            width: 300,
                            decoration: const BoxDecoration(
                              color: ColorsCard.backgroundcard,
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 170,
                                      width: 150,
                                      child: Image.asset(
                                          'assets/images/urvan.png'),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 170,
                                      width: 150,
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 10),
                                                width: 150,
                                                height: 34,
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 30,
                                                          height: 30,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/cambio.svg',
                                                            color: ColorsLetras
                                                                .colorletraprimario,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8),
                                                          child: const Text(
                                                            'Estandar',
                                                            style: StyleText
                                                                .estiloletracard,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                  top: 2,
                                                ),
                                                width: 150,
                                                height: 34,
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 27,
                                                          height: 27,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/ac.svg',
                                                            color: ColorsLetras
                                                                .colorletraprimario,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 12,
                                                                  right: 10),
                                                          child: const Text(
                                                            'Si',
                                                            style: StyleText
                                                                .estiloletracard,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 30,
                                                          height: 30,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/asiento.svg',
                                                            color: ColorsLetras
                                                                .colorletraprimario,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 5),
                                                          child: const Text(
                                                            '4',
                                                            style: StyleText
                                                                .estiloletracard,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 2),
                                                width: 150,
                                                height: 34,
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 30,
                                                          height: 30,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/car.svg',
                                                            color: ColorsLetras
                                                                .colorletraprimario,
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 4,
                                                                  left: 10),
                                                          child: const Text(
                                                            'Nissan NV350',
                                                            style: StyleText
                                                                .estiloletracard,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 150,
                                                height: 34,
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10,
                                                                  right: 12),
                                                          width: 10,
                                                          height: 10,
                                                          child: SvgPicture.asset(
                                                              'assets/icons/peso.svg'),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10),
                                                          child: const Text(
                                                            '400.00',
                                                            style: StyleText
                                                                .estiloletrapreciocard,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 9),
                                                width: 150,
                                                height: 10,
                                                child: Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 44),
                                                          child: const Text(
                                                            'Precio por día',
                                                            style: StyleText
                                                                .estiloletradia,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
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
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
