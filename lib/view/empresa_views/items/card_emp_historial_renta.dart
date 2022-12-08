import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/model/historial_renta.dart';
import 'package:vitrapp/util/convert_size.dart';

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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final storage = Hive.box('storage');
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.listHistorial.length,
        itemBuilder: (context, index) {
          ResultsHistorialRenta data = widget.listHistorial[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: (index != widget.listHistorial.length - 1)
                    ? const EdgeInsets.only(top: 10)
                    : const EdgeInsets.only(top: 10, bottom: 10),
                width: convertWidth(width, 250),
                height: convertHeight(height, 170),
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
                      width: convertWidth(width, 250),
                      height: convertHeight(height, 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: convertWidth(width, 250),
                            child: Text(
                              '${storage.get(1)}',
                              textAlign: TextAlign.center,
                              style: EstiloLabelsHistorial.titulo,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: convertWidth(width, 230),
                      height: convertHeight(height, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: convertWidth(width, 60),
                            child: const Text(
                              'Nombre',
                              style: EstiloLabelsHomeEmpresa.primario,
                            ),
                          ),
                          SizedBox(
                            width: convertWidth(width, 101),
                            child: const Text(
                              'Fecha de renta',
                              style: EstiloLabelsHomeEmpresa.primario,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 1),
                      width: convertWidth(width, 230),
                      height: convertHeight(height, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: convertWidth(width, 90),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '${data.nombre}',
                                style: EstiloLabelsHomeEmpresa.secundarios,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: convertWidth(width, 90),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '${data.fecha}',
                                style: EstiloLabelsHomeEmpresa.secundarios,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: convertWidth(width, 230),
                      height: convertHeight(height, 20),
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
                      width: convertWidth(width, 200),
                      height: convertHeight(height, 20),
                      child: Row(
                        children: [
                          SizedBox(
                            width: convertWidth(width, 60),
                            child: Text(
                              '${data.dias}',
                              textAlign: TextAlign.center,
                              style: EstilosCards.labelsecundarios,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: convertWidth(width, 180),
                      height: convertHeight(height, 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            width: convertWidth(width, 30),
                            height: convertHeight(height, 30),
                            child: SvgPicture.asset(
                              'assets/icons/unidades/simbolo_peso.svg',
                              width: convertWidth(width, 15),
                              height: convertHeight(height, 15),
                            ),
                          ),
                          SizedBox(
                            width: convertWidth(width, 120),
                            height: convertHeight(height, 30),
                            child: Text(
                              '${data.total}.00',
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
