import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:vitrapp/model/transporte.dart';
import 'package:vitrapp/util/convert_size.dart';
import 'package:vitrapp/view/alerts/no_data_transporte.dart';
import '../../../styles/colors/colors_base.dart';
import '../../../styles/colors/colors_card.dart';
import '../../../styles/colors/colors_efects.dart';
import '../../../styles/colors/colors_input.dart';
// ignore: depend_on_referenced_packages
import '../compra/renta/viajero_renta_transporte.dart';

class CardViajeroHomeRenta extends StatefulWidget {
  final List<Results> listResults;
  const CardViajeroHomeRenta({super.key, required this.listResults});

  @override
  State<CardViajeroHomeRenta> createState() => _CardViajeroHomeRentaState();
}

class _CardViajeroHomeRentaState extends State<CardViajeroHomeRenta> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: (widget.listResults.isNotEmpty)
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.listResults.length,
                itemBuilder: (context, index) {
                  Results data = widget.listResults[index];
                  return Container(
                    margin: const EdgeInsets.only(left: 10),
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
                          bottom: 110,
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
                          bottom: 90,
                          left: 20,
                          child: SizedBox(
                            width: convertWidth(width, 300),
                            height: convertHeight(height, 230),
                            child: SvgPicture.asset(
                                'assets/images/card_pressed/card_car.svg'),
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
                          child: Text(
                            '${data.modelo}',
                            style: GoogleFonts.mPlusRounded1c(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: ColorsBase.colorprimario,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 220,
                          left: 15,
                          child: Text(
                            '${data.detalles}',
                            style: GoogleFonts.mPlusRounded1c(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: ColorsBase.colorprimario,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 250,
                          left: 190,
                          child: Container(
                            width: convertWidth(width, 150),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
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
              )
            : nodatatransporte());
  }
}
