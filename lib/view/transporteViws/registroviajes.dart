import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrapp/styles/colors/colorsapp.dart';

class RegistroViajes extends StatelessWidget {
  const RegistroViajes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.only(top: 30),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 30, top: 70),
                    child: const Text(
                      "Registro",
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
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: const Text(
                    " de ",
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
                  margin: const EdgeInsets.only(right: 20, top: 70),
                  child: const Text(
                    "viajes",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Nunito Sans',
                      fontWeight: FontWeight.bold,
                      color: ColorsLetras.colorletraprimario,
                      shadows: [
                        Shadow(
                            blurRadius: 8,
                            color: ColorBlurEffect.colorblur,
                            offset: Offset(3, 3))
                      ],
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/maletaviaje.svg',
                  height: 100,
                  width: 100,
                  color: ColorsLetras.colorletraprimario,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 10),
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
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                      child: const Text(
                        'Origen',
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
                      width: 340,
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorsInput.colorinput,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: ColorsInput.colorborderinput))),
                      ),
                    )
                  ],
                ),
                Row(children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                    child: const Text(
                      'Destino',
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
                      margin: const EdgeInsets.only(left: 30),
                      width: 340,
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorsInput.colorinput,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: ColorsInput.colorborderinput))),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 5, top: 10, bottom: 10),
                      child: const Text(
                        'Fecha',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                      child: const Text(
                        'Hora',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                      child: const Text(
                        'Asientos disp.',
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
                      width: 90,
                      height: 45,
                      decoration: BoxDecoration(
                          color: ColorsInput.colorinput,
                          border:
                              Border.all(color: ColorsInput.colorborderinput),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      child: IconButton(
                        icon: const Icon(Icons.calendar_month),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      width: 90,
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorsInput.colorinput,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: ColorsInput.colorborderinput))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30),
                      width: 100,
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorsInput.colorinput,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: ColorsInput.colorborderinput))),
                      ),
                    )
                  ],
                ),
                Row(children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 33, top: 10, bottom: 10),
                    child: const Text(
                      'Precio',
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
                      margin: const EdgeInsets.only(left: 30),
                      width: 340,
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorsInput.colorinput,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: const BorderSide(
                                    color: ColorsInput.colorborderinput))),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(left: 30, top: 15),
                        width: 220,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: ColorButton.colobontonregistrar),
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
