import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vitrapp/view/viajero_views/Items/card_viajero_home_renta.dart';
import 'package:vitrapp/view/viajero_views/Items/card_viajero_home.dart';
import '../../styles/colors/colors_efects.dart';
import '../../styles/colors/colors_input.dart';
import '../../styles/fontstyles/estilo_home_viajero.dart';

class ViajeroHome extends StatefulWidget {
  const ViajeroHome({super.key});

  @override
  State<ViajeroHome> createState() => _ViajeroHomeState();
}

class _ViajeroHomeState extends State<ViajeroHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 70,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: ColorBlurEfect.blur,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: FileImage(
                              File(
                                  '/data/user/0/com.virtualdevs.vitraapp/cache/image_picker3290204612354716786.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    height: 100,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 210,
                              height: 100,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            top: 10, right: 5),
                                        width: 150,
                                        height: 40,
                                        child: const SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            'Hola Javy',
                                            style:
                                                EstiloLabelsHomeViajero.saludo,
                                            overflow: TextOverflow.clip,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        child: Image.asset(
                                          'assets/images/home_viajero/hv_saludo.png',
                                          width: 50,
                                          height: 50,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      SizedBox(
                                        width: 200,
                                        height: 20,
                                        child: Text(
                                          'Bienvenido a VITRA',
                                          style: EstiloLabelsHomeViajero
                                              .bienvenida,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 50,
                    width: 350,
                    child: Text(
                      'Viajes proximos',
                      style: EstiloLabelsHomeViajero.encabezados,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 350,
                    height: 200,
                    child: CardViajeroHome(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 40,
                    width: 350,
                    child: Text(
                      'Tus rentas',
                      style: EstiloLabelsHomeViajero.encabezados,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 350,
                    height: 200,
                    child: CardViajeroHomeRenta(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
