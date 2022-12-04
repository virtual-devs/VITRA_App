import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrapp/model/viajes.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/fontstyles/estilo_cards.dart';
import 'package:vitrapp/view/viajero_views/compra/renta/viajero_compra_viaje.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';

import '../../../styles/fontstyles/estilo_barra_busqueda.dart';

class CardHomeViaje extends StatefulWidget {
  final List<ResultsViajes> listViajes;
  const CardHomeViaje({super.key, required this.listViajes});

  @override
  State<CardHomeViaje> createState() => _CardHomeViajeState();
}

class _CardHomeViajeState extends State<CardHomeViaje> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 350,
      height: 558,
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: (widget.listViajes.isNotEmpty)
          ? ListView.builder(
              itemCount: widget.listViajes.length,
              itemBuilder: (context, index) {
                ResultsViajes data = widget.listViajes[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Route route = MaterialPageRoute(
                          builder: (context) => ViajeroCompraViaje(item: data),
                        );
                        Navigator.push(context, route);
                      },
                      child: Container(
                        margin: (index != 4)
                            ? const EdgeInsets.only(top: 10)
                            : const EdgeInsets.only(bottom: 10, top: 10),
                        width: 270,
                        height: 200,
                        decoration: const BoxDecoration(
                          color: ColorsCard.background,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 11,
                              color: ColorBlurEfect.blur,
                              offset: Offset(0, 5),
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: const Text(
                                    'Viajes Tuxtla Gtz - Pichucalco',
                                    style: EstilosCards.labeltitulo,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 135,
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 18),
                                          child: const Text(
                                            'Origen',
                                            style: EstilosCards.labelsprimarios,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 135,
                                    child: Row(
                                      children: const [
                                        Text(
                                          'Destino',
                                          style: EstilosCards.labelsprimarios,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 135,
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 18),
                                        child: Text(
                                          '${data.origen}',
                                          overflow: TextOverflow.ellipsis,
                                          style: EstilosCards.labelsecundarios,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 135,
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 18),
                                        child: Text(
                                          '${data.destino}',
                                          style: EstilosCards.labelsecundarios,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 90,
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 18),
                                          child: const Text(
                                            'Fecha',
                                            style: EstilosCards.labelsprimarios,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: const Text(
                                            'Hora',
                                            style: EstilosCards.labelsprimarios,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 75,
                                    height: 40,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: const Text(
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.fade,
                                            'Asientos disp.',
                                            style: EstilosCards.labelsprimarios,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 60,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 60,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            '${data.fecha}',
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                EstilosCards.labelsecundarios,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${data.hora}',
                                        style: EstilosCards.labelsecundarios,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${data.asientosDisp}',
                                        style: EstilosCards.labelsecundarios,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                            height: 10,
                                            child: SvgPicture.asset(
                                                'assets/icons/unidades/simbolo_peso.svg'),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            width: 100,
                                            height: 40,
                                            child: Text(
                                              '${data.precio}.00',
                                              style: EstilosCards.labelprecio,
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
                    ),
                  ],
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
                      '¡Opss, parece que no hay ningun viaje!',
                      style: EstiloBarraBusqueda.labelbarrabusqueda,
                    ),
                  ],
                ),
              ),
            ),
    ));
  }
}
