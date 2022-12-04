import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';

import '../../../model/transporte.dart';
// ignore: depend_on_referenced_packages

import '../compra/renta/viajero_renta_transporte.dart';

class CardListaTransporte extends StatefulWidget {
  final List<Results> listResults;
  const CardListaTransporte({super.key, required this.listResults});

  @override
  State<CardListaTransporte> createState() => _CardListaTransporteState();
}

class _CardListaTransporteState extends State<CardListaTransporte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: widget.listResults.length,
      itemBuilder: (context, index) {
        Results data = widget.listResults[index];
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
                bottom: 52,
                left: 30,
                child: SizedBox(
                  width: 300,
                  height: 250,
                  child: SvgPicture.asset(
                      'assets/images/card_pressed/card_car.svg'),
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
                          blurRadius: 19,
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
                  width: 240,
                  child: Text(
                    '${data.modelo}',
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
                    '${data.detalles}',
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
                left: 190,
                child: Container(
                  width: 150,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ElevatedButton(
                    onPressed: () {
                      Route route = MaterialPageRoute(
                        builder: (context) => ViajeroRentaTransporte(
                          dataItem: data,
                        ),
                      );
                      Navigator.push(context, route);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('¡Rentar ahora!'),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
