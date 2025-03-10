import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/data/response/api_response.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';
import 'package:vitrapp/view-model/viajero_view_model.dart';
import 'package:vitrapp/view/empresa_views/edit/emp_editar_transporte.dart';

import '../../../model/transporte.dart';
import '../../../styles/colors/colors_base.dart';
import '../../../styles/colors/colors_card.dart';
import '../../../styles/fontstyles/estilo_cards.dart';

class CardUnidades extends StatefulWidget {
  final List<Results> listResults;
  final ViajeroViewModel edit;
  const CardUnidades({
    super.key,
    required this.listResults,
    required this.edit,
  });
  @override
  State<CardUnidades> createState() => _CardUnidadesState();
}

class _CardUnidadesState extends State<CardUnidades> {
  final storage = Hive.box('storage');
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: (widget.listResults.isNotEmpty)
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.listResults.length,
              itemBuilder: (context, index) {
                Results data = widget.listResults[index];
                return Slidable(
                  startActionPane: startAction(widget.edit, "${data.id}"),
                  endActionPane: ednAction(data, widget.edit),
                  child: Container(
                    margin: (widget.listResults.length > 1 &&
                            index != widget.listResults.length - 1)
                        ? const EdgeInsets.only(bottom: 10)
                        : const EdgeInsets.only(bottom: 40),
                    height: height / 4.3,
                    width: width / 1.2,
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
                              width: width / 2.55,
                              child: SvgPicture.asset(
                                  'assets/images/card_pressed/card_car.svg'),
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
                                                    color: ColorsBase
                                                        .colorsecundario,
                                                  ),
                                                ),
                                                Container(
                                                  width: 102,
                                                  margin: const EdgeInsets.only(
                                                      left: 8),
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
                                                    color: ColorsBase
                                                        .colorsecundario,
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
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style:
                                                          EstiloListCarsLabels
                                                              .primarios,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 30,
                                                  height: 30,
                                                  child: SvgPicture.asset(
                                                    'assets/icons/unidades/asiento.svg',
                                                    color: ColorsBase
                                                        .colorsecundario,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: Text(
                                                    data.numAsientos.toString(),
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
                                                    color: ColorsBase
                                                        .colorsecundario,
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
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style:
                                                          EstiloListCarsLabels
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
                                                  margin: const EdgeInsets.only(
                                                      left: 10),
                                                  child: Text(
                                                    '${data.precio.toString()}.00',
                                                    style: EstiloListCarsLabels
                                                        .precio,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 9),
                                        width: 150,
                                        height: 10,
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 44),
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
            )
          : const Center(child: Text('No tiene ningun transporte agregado')),
    );
  }

  ActionPane startAction(ViajeroViewModel delete, String id) {
    return ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          onPressed: (context) async {
            await delete.vmDeleteTransporte(id);
            delete.setAutoListResponse(ApiResponse.loading());
            delete.vmGetTransportesId(storage.get(5));
          },
          icon: Icons.delete,
          backgroundColor: ColorsBaseDanger.delete,
        ),
      ],
    );
  }

  ActionPane ednAction(Results item, ViajeroViewModel edit) {
    return ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            Route route = MaterialPageRoute(
                builder: (context) => EmpresaEditarTransporte(
                      item: item,
                      edit: edit,
                    ));
            Navigator.push(context, route);
          },
          icon: Icons.edit,
          backgroundColor: ColorsBaseEdit.delete,
        ),
      ],
    );
  }
}
