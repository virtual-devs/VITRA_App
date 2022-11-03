import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrapp/styles/colors/colorsapp.dart';

class RegistroAutos extends StatefulWidget {
  const RegistroAutos({super.key});

  @override
  State<RegistroAutos> createState() => _RegistroAutosState();
}

class _RegistroAutosState extends State<RegistroAutos> {
  bool valueSi = false;
  bool valueNo = false;
  bool automatic = false;
  bool estandar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: const Text(
                            'Registro ',
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.bold,
                              color: ColorsLetras.colorletrasecundario,
                              shadows: [
                                Shadow(
                                    blurRadius: 8,
                                    color: ColorBlurEffect.colorblur,
                                    offset: Offset(3, 3))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 36),
                          child: const Text(
                            'de',
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.bold,
                              color: ColorsLetras.colorletrasecundario,
                              shadows: [
                                Shadow(
                                    blurRadius: 8,
                                    color: ColorBlurEffect.colorblur,
                                    offset: Offset(3, 3))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: const Text(
                            'unidades',
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Nunito Sans',
                              fontWeight: FontWeight.bold,
                              color: ColorsLetras.colorletrasecundario,
                              shadows: [
                                Shadow(
                                    blurRadius: 8,
                                    color: ColorBlurEffect.colorblur,
                                    offset: Offset(3, 3))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: SvgPicture.asset('assets/images/layer1.svg'),
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Imagen',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 170,
                  height: 120,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 3,
                            color: ColorBlurEffect.colorblur,
                            offset: Offset(3, 3))
                      ],
                      border: Border.all(color: ColorsInput.colorborderimage),
                      color: ColorsInput.colorinput,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: IconButton(
                    icon: const Icon(
                      Icons.image,
                      size: 34,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(right: 15, top: 10, bottom: 5),
                      child: const Text(
                        'Trasmisión',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 60, top: 10, bottom: 5, right: 30),
                      child: const Text(
                        'A/C',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      width: 180,
                      height: 100,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'Estandar',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Checkbox(
                                      shape: const CircleBorder(),
                                      activeColor:
                                          ColorsLetras.colorletraprimario,
                                      value: estandar,
                                      onChanged: ((bool? valor) {
                                        setState(() {
                                          estandar = valor!;
                                        });
                                      })),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Automatica',
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Checkbox(
                                      shape: const CircleBorder(),
                                      activeColor:
                                          ColorsLetras.colorletraprimario,
                                      value: automatic,
                                      onChanged: ((bool? valor) {
                                        setState(() {
                                          automatic = valor!;
                                        });
                                      })),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      width: 135,
                      height: 45,
                      child: Row(
                        children: [
                          const Text(
                            'Si',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Checkbox(
                              shape: const CircleBorder(),
                              value: valueSi,
                              activeColor: ColorsLetras.colorletraprimario,
                              onChanged: ((bool? valor) {
                                setState(() {
                                  valueSi = valor!;
                                });
                              })),
                          const Text(
                            'No',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Checkbox(
                              shape: const CircleBorder(),
                              activeColor: ColorsLetras.colorletraprimario,
                              value: valueNo,
                              onChanged: ((bool? valor) {
                                setState(() {
                                  valueNo = valor!;
                                });
                              })),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                      child: const Text(
                        'Modelo',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 30, top: 10, bottom: 5),
                      child: const Text(
                        'Precio por día',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      width: 162,
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorsInput.colorborderinput,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: ColorsInput.colorborderinput))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 18),
                      width: 160,
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorsInput.colorborderinput,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: ColorsInput.colorborderinput))),
                      ),
                    )
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    child: const Text(
                      'Detalles',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 30, bottom: 5),
                      width: 340,
                      height: 150,
                      child: TextFormField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorsInput.colorborderinput,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: ColorsInput.colorborderinput))),
                        keyboardType: TextInputType.multiline,
                        maxLines: 8,
                        maxLength: 1000,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                        ),
                        width: 220,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: ColorsInput.colorborderimage),
                          onPressed: () => {},
                          child: const Text(
                            'Registrar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
