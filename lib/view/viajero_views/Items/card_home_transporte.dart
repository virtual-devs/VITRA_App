import 'package:flutter/material.dart';
import 'package:vitrapp/model/transporte.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/fontstyles/estilo_cards.dart';
import 'package:vitrapp/view/viajero_views/viajero_renta_transporte.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

class CardHomeTransporte extends StatefulWidget {
  final List<Results> listResults;
  const CardHomeTransporte({
    super.key,
    required this.listResults,
  });

  @override
  State<CardHomeTransporte> createState() => _CardHomeTransporteState();
}

class _CardHomeTransporteState extends State<CardHomeTransporte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.listResults.length,
        itemBuilder: (context, index) {
          Results data = widget.listResults[index];
          return InkWell(
            onTap: () {
              Route route = MaterialPageRoute(
                builder: (context) => ViajeroRentaTransporte(
                  dataItem: data,
                ),
              );
              Navigator.push(context, route);
            },
            child: Container(
              margin: (index == 0)
                  ? const EdgeInsets.only(left: 10, bottom: 10, right: 10)
                  : const EdgeInsets.all(10),
              height: 170,
              width: 300,
              decoration: const BoxDecoration(
                color: ColorsCard.background,
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
                        child: Image.network(data.urlFoto.toString()),
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
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 150,
                                  height: 34,
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: SvgPicture.asset(
                                              'assets/icons/unidades/cambio.svg',
                                              color: ColorsBase.colorsecundario,
                                            ),
                                          ),
                                          Container(
                                            width: 102,
                                            margin:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                              data.trasmision.toString(),
                                              style: EstiloListCarsLabels
                                                  .primarios,
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
                                            child: SvgPicture.asset(
                                              'assets/icons/unidades/ac.svg',
                                              color: ColorsBase.colorsecundario,
                                            ),
                                          ),
                                          Container(
                                            width: 50,
                                            height: 30,
                                            alignment: Alignment.center,
                                            margin: const EdgeInsets.only(
                                                right: 10),
                                            child: SingleChildScrollView(
                                              child: Text(
                                                data.ac.toString(),
                                                overflow: TextOverflow.fade,
                                                style: EstiloListCarsLabels
                                                    .primarios,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: SvgPicture.asset(
                                              'assets/icons/unidades/asiento.svg',
                                              color: ColorsBase.colorsecundario,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: Text(
                                              data.ac.toString(),
                                              style: EstiloListCarsLabels
                                                  .primarios,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  width: 150,
                                  height: 34,
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: SvgPicture.asset(
                                              'assets/icons/unidades/car.svg',
                                              color: ColorsBase.colorsecundario,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 4, left: 10),
                                            width: 90,
                                            height: 34,
                                            child: SingleChildScrollView(
                                              child: Text(
                                                data.modelo.toString(),
                                                overflow: TextOverflow.fade,
                                                style: EstiloListCarsLabels
                                                    .primarios,
                                              ),
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
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 12),
                                            width: 10,
                                            height: 10,
                                            child: SvgPicture.asset(
                                                'assets/icons/unidades/simbolo_peso.svg'),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              data.precio.toString(),
                                              style:
                                                  EstiloListCarsLabels.precio,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 9),
                                  width: 150,
                                  height: 10,
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 44),
                                            child: const Text(
                                              'Precio por día',
                                              style: EstiloListCarsLabels
                                                  .avisoprecio,
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
          );
        },
      ),
    );
  }
}
