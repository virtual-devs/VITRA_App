import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:vitrapp/model/viajes.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrapp/util/convert_size.dart';

import '../../../styles/colors/colors_base.dart';
import '../../../styles/colors/colors_card.dart';
import '../../../styles/fontstyles/estilo_barra_busqueda.dart';
import '../compra/renta/viajero_compra_viaje.dart';

class CardViajeroHome extends StatefulWidget {
  final List<ResultsViajes> listaViajes;
  const CardViajeroHome({super.key, required this.listaViajes});

  @override
  State<CardViajeroHome> createState() => _CardViajeroHomeState();
}

class _CardViajeroHomeState extends State<CardViajeroHome> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: (widget.listaViajes.isNotEmpty)
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.listaViajes.length,
              itemBuilder: (context, index) {
                ResultsViajes data = widget.listaViajes[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: convertWidth(width, 350),
                  height: convertHeight(height, 270),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: ColorsInput.borderinput),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: convertWidth(width, 350),
                        height: convertHeight(height, 170),
                        alignment: Alignment.centerRight,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: Colors.amber,
                        ),
                      ),
                      Positioned(
                        left: -20,
                        bottom: 88,
                        child: Text(
                          'VITRA',
                          style: GoogleFonts.mPlusRounded1c(
                            textStyle: const TextStyle(
                              fontSize: 135,
                              fontWeight: FontWeight.w800,
                              color: ColorsCard.letra,
                            ),
                          ),
                          softWrap: true,
                        ),
                      ),
                      Positioned(
                        bottom: 110,
                        left: 50,
                        child: SizedBox(
                          width: convertWidth(width, 300),
                          height: convertHeight(height, 180),
                          child: SvgPicture.asset(
                              'assets/images/card_pressed/card_viaje.svg'),
                        ),
                      ),
                      Positioned(
                        left: 85,
                        top: 130,
                        child: Container(
                          width: convertWidth(width, 180),
                          height: convertHeight(height, 60),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: ColorsCard.backgroundcontainerlist,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                  color: ColorBlurEfect.blur,
                                )
                              ]),
                          child: Text(
                            '\$ ${data.precio}.00',
                            style: GoogleFonts.mPlusRounded1c(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: ColorsBase.colorsecundario,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 185,
                        left: 15,
                        child: SizedBox(
                          width: convertWidth(width, 240),
                          child: Text(
                            '${data.origen}',
                            style: GoogleFonts.mPlusRounded1c(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: ColorsBase.colorprimario,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 220,
                        left: 15,
                        child: SizedBox(
                          width: convertWidth(width, 200),
                          child: Text(
                            '${data.destino}',
                            style: GoogleFonts.mPlusRounded1c(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: ColorsBase.colorprimario,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 240,
                        left: 160,
                        child: Container(
                          width: convertWidth(width, 180),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ElevatedButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) =>
                                      ViajeroCompraViaje(item: data));
                              Navigator.push(context, route);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                            ),
                            child: const Text('¡Aparta un lugar ahora!'),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          : SizedBox(
              width: convertWidth(width, 350),
              height: convertHeight(height, 480),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: convertWidth(width, 200),
                      height: convertHeight(height, 200),
                      child: Lottie.asset('assets/gif/109013-oopsie.json'),
                    ),
                    const Text(
                      '¡Opss, parece que no hay ningun viaje!',
                      style: EstiloBarraBusqueda.labelbarrabusqueda,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
