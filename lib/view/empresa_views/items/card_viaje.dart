import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vitrapp/model/viajes.dart';
import 'package:vitrapp/view-model/viajero_view_model.dart';
import 'package:vitrapp/view/empresa_views/edit/emp_editar_viaje.dart';

import '../../../styles/colors/colors_base.dart';
import '../../../styles/colors/colors_card.dart';
import '../../../styles/colors/colors_efects.dart';
import '../../../styles/fontstyles/estilo_cards.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

class CardViaje extends StatefulWidget {
  final List<ResultsViajes> listViajes;
  final ViajeroViewModel delete;
  const CardViaje({
    super.key,
    required this.listViajes,
    required this.delete,
  });

  @override
  State<CardViaje> createState() => _CardViajeState();
}

class _CardViajeState extends State<CardViaje> {
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
        child: ListView.builder(
          itemCount: widget.listViajes.length,
          itemBuilder: (context, index) {
            ResultsViajes data = widget.listViajes[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slidable(
                  startActionPane: startAction(widget.delete, "${data.id}"),
                  endActionPane: ednAction(data),
                  child: Container(
                    margin: (index != widget.listViajes.length - 1)
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
                              alignment: Alignment.center,
                              width: 260,
                              margin: const EdgeInsets.only(top: 5),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  '${index + 1}',
                                  textAlign: TextAlign.center,
                                  style: EstilosCards.labeltitulo,
                                  overflow: TextOverflow.ellipsis,
                                ),
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
                                      margin: const EdgeInsets.only(left: 18),
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
                                  child: Text(
                                    '${data.destino}',
                                    style: EstilosCards.labelsecundarios,
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
                                      margin: const EdgeInsets.only(left: 18),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Hora',
                                      style: EstilosCards.labelsprimarios,
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
                                      margin: const EdgeInsets.only(left: 10),
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
                              width: 70,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 70,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        '${data.fecha}',
                                        overflow: TextOverflow.ellipsis,
                                        style: EstilosCards.labelsecundarios,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
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
                            ),
                            SizedBox(
                              width: 60,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ),
    );
  }

  ActionPane startAction(ViajeroViewModel delete, String id) {
    return ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          onPressed: (context) async {
            await delete.vmDeleteViaje(id);
            await delete.vmGetViajes();
          },
          icon: Icons.delete,
          backgroundColor: ColorsBaseDanger.delete,
        ),
      ],
    );
  }

  ActionPane ednAction(ResultsViajes item) {
    return ActionPane(
      motion: const StretchMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            Route route = MaterialPageRoute(
              builder: (context) => EmpresaEditarViaje(item: item),
            );
            Navigator.push(context, route);
          },
          icon: Icons.edit,
          backgroundColor: ColorsBaseEdit.delete,
        ),
      ],
    );
  }
}
