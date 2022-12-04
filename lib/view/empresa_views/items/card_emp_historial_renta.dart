import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrapp/model/historial_renta.dart';

import '../../../styles/colors/colors_efects.dart';
import '../../../styles/colors/colors_input.dart';
import '../../../styles/fontstyles/estilo_cards.dart';

class CardEmpresaHistorialRenta extends StatefulWidget {
  final List<ResultsHistorialRenta> listHistorial;
  const CardEmpresaHistorialRenta({super.key, required this.listHistorial});

  @override
  State<CardEmpresaHistorialRenta> createState() =>
      _CardEmpresaHistorialRentaState();
}

class _CardEmpresaHistorialRentaState extends State<CardEmpresaHistorialRenta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: ListView.builder(
        itemCount: widget.listHistorial.length,
        itemBuilder: (context, index) {
          ResultsHistorialRenta data = widget.listHistorial[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: (index != 4)
                    ? const EdgeInsets.only(top: 10)
                    : const EdgeInsets.only(top: 10, bottom: 10),
                width: 250,
                height: 170,
                decoration: const BoxDecoration(
                  color: ColorsInput.backgroundinput,
                  borderRadius: BorderRadius.all(
                    Radius.circular(9),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 11,
                      offset: Offset(0, 5),
                      spreadRadius: -1,
                      color: ColorBlurEfect.blur,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: 250,
                      height: 20,
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 250,
                            child: Text(
                              'Renta de transporte Montecristo',
                              textAlign: TextAlign.center,
                              style: EstiloLabelsHistorial.titulo,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: 230,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            width: 60,
                            child: Text(
                              'Nombre',
                              style: EstiloLabelsHomeEmpresa.primario,
                            ),
                          ),
                          SizedBox(
                            width: 101,
                            child: Text(
                              'Fecha de renta',
                              style: EstiloLabelsHomeEmpresa.primario,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 1),
                      width: 230,
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(
                            width: 90,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                'Erik Toledo Trinidad',
                                style: EstiloLabelsHomeEmpresa.secundarios,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 90,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '22/10/2022',
                                style: EstiloLabelsHomeEmpresa.secundarios,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: 230,
                      height: 20,
                      child: Row(
                        children: const [
                          SizedBox(
                            child: Text(
                              'Días de renta',
                              style: EstiloLabelsHomeEmpresa.primario,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 20,
                      child: Row(
                        children: const [
                          SizedBox(
                            width: 60,
                            child: Text(
                              '4',
                              textAlign: TextAlign.center,
                              style: EstilosCards.labelsecundarios,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            width: 30,
                            height: 30,
                            child: SvgPicture.asset(
                              'assets/icons/unidades/simbolo_peso.svg',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 120,
                            height: 30,
                            child: Text(
                              '400.00',
                              style: EstilosCards.labelprecio,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
