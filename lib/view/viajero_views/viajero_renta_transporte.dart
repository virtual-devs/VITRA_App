import 'package:flutter/material.dart';
import 'package:vitrapp/model/transporte.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/fontstyles/estilo_cards.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/colors/colors_input.dart';

class ViajeroRentaTransporte extends StatefulWidget {
  final Results dataItem;
  const ViajeroRentaTransporte({
    super.key,
    required this.dataItem,
  });

  @override
  State<ViajeroRentaTransporte> createState() => _ViajeroRentaTransporteState();
}

class _ViajeroRentaTransporteState extends State<ViajeroRentaTransporte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: 380,
                  child: Row(
                    children: [
                      SizedBox(
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: ColorsBase.colorsecundario,
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
                                  color: ColorBlurEfect.blur,
                                  offset: Offset(0, 4),
                                  spreadRadius: 3)
                            ]),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/images/card_pressed/cp_avatar_default.jpg'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 28),
                        alignment: Alignment.center,
                        width: 200,
                        height: 100,
                        child: Text(
                          widget.dataItem.nombreEmpresa.toString(),
                          overflow: TextOverflow.fade,
                          style: EstiloCardPresionada.labelnombrempresa,
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
                        color: ColorsCard.backgroundcardpresionada,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
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
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                height: 250,
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          height: 170,
                                          child: Image.asset(
                                            'assets/images/card_pressed/cp_car_default.png',
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
                                                margin: const EdgeInsets.only(
                                                    left: 4),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/unidades/car.svg',
                                                            color: ColorsBase
                                                                .colorsecundario,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 4),
                                                      child: const Text(
                                                        'Nissan NV350',
                                                        style:
                                                            EstiloCardPresionada
                                                                .labelmodelocar,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      SizedBox(
                                                        width: 30,
                                                        height: 40,
                                                        child: Icon(
                                                            Icons.location_on),
                                                      )
                                                    ],
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    height: 50,
                                                    width: 110,
                                                    child: const Text(
                                                      'Calle Segunda Pte. Nte. 342-2, Niño de Atocha, 29037 Tuxtla Gutiérrez, Chis.',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style:
                                                          EstiloCardPresionada
                                                              .labelubicacion,
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
                                                  'assets/icons/unidades/asiento.svg',
                                                  color: ColorsBase
                                                      .colorsecundario,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: const Text(
                                                  '10',
                                                  style: EstiloCardPresionada
                                                      .labelssimilares,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 7, left: 1),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: SvgPicture.asset(
                                                  'assets/icons/unidades/cambio.svg',
                                                  color: ColorsBase
                                                      .colorsecundario,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: const Text(
                                                  'Estandar',
                                                  style: EstiloCardPresionada
                                                      .labelssimilares,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 7, left: 1),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: 25,
                                                height: 25,
                                                child: SvgPicture.asset(
                                                  'assets/icons/unidades/ac.svg',
                                                  color: ColorsBase
                                                      .colorsecundario,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15),
                                                child: const Text(
                                                  'Si',
                                                  style: EstiloCardPresionada
                                                      .labelssimilares,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 13, top: 7),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: 10,
                                                height: 10,
                                                child: SvgPicture.asset(
                                                  'assets/icons/unidades/peso.svg',
                                                  color: ColorsBase
                                                      .colorsecundario,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 20),
                                                child: const Text(
                                                  '400.00',
                                                  style: EstiloCardPresionada
                                                      .labelprecio,
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
                                          margin:
                                              const EdgeInsets.only(left: 39),
                                          child: const Text(
                                            'Precio proporcionado es unicamente por día',
                                            overflow: TextOverflow.fade,
                                            style:
                                                EstiloCardPresionada.labelaviso,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 12),
                                          height: 50,
                                          width: 100,
                                          child: Image.asset(
                                              'assets/images/card_pressed/cp_logo_paypal.png'),
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
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  width: 300,
                  height: 50,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'Dias de renta',
                              style: EstiloCardPresionada.labeldiasrenta,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorsInput.backgroundinput,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: ColorsInput.borderinput),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    children: const [
                      Text(
                        'Detalles',
                        style: EstiloCardPresionada.labeldetalle,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: ColorsCard.backgroundcardpresionada,
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
                          child: const SizedBox(
                            width: 280,
                            height: 80,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse ut metus. Proin venenatis turpis sit amet ante consequat semper. Aenean nunc. Duis iaculis odio id lectus. Integer dapibus justo vitae elit.Nunc luctus, tortor quis iaculis tempus, urna odio iaculis erat.',
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.fade,
                                style: EstiloCardPresionada.labeltextodetalle,
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
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
                                        'assets/images/card_pressed/default_chat.png'),
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
