import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitrapp/model/viajes.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';
import 'package:vitrapp/view/viajero_views/compra/renta/viajero_compra_viaje.dart';

// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';

import '../../../styles/fontstyles/estilo_barra_busqueda.dart';

class CardListaViajes extends StatefulWidget {
  final List<ResultsViajes> listResults;
  const CardListaViajes({super.key, required this.listResults});

  @override
  State<CardListaViajes> createState() => _CardListaViajesState();
}

class _CardListaViajesState extends State<CardListaViajes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (widget.listResults.isNotEmpty)
          ? ListView.builder(
              itemCount: widget.listResults.length,
              itemBuilder: (context, index) {
                ResultsViajes data = widget.listResults[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 350,
                  height: 270,
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
                        width: 350,
                        height: 170,
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
                        bottom: 88,
                        left: 50,
                        child: SizedBox(
                          width: 300,
                          height: 180,
                          child: SvgPicture.asset(
                              'assets/images/card_pressed/card_viaje.svg'),
                        ),
                      ),
                      Positioned(
                        left: 85,
                        top: 130,
                        child: Container(
                          width: 180,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: ColorsCard.backgroundcontainerlist,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
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
                          width: 240,
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
                          width: 200,
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
                        top: 220,
                        left: 160,
                        child: Container(
                          width: 180,
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
              width: 350,
              height: 480,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Lottie.asset('assets/gif/109013-oopsie.json'),
                    ),
                    const Text(
                      '¡Opss, parece que no hay ningun transporte!',
                      style: EstiloBarraBusqueda.labelbarrabusqueda,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
