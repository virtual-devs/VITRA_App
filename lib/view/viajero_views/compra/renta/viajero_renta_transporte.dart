import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/model/transporte.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_botons.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/fontstyles/estilo_cards.dart';
// ignore: depend_on_referenced_packages
import 'package:slide_to_act/slide_to_act.dart';
// ignore: depend_on_referenced_packages
import 'package:quickalert/quickalert.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../styles/colors/colors_input.dart';
import '../../../../view-model/viajero_view_model.dart';

class ViajeroRentaTransporte extends StatefulWidget {
  final Results dataItem;
  const ViajeroRentaTransporte({
    super.key,
    required this.dataItem,
  });

  @override
  State<ViajeroRentaTransporte> createState() => _ViajeroRentaTransporteState();
}

class _ViajeroRentaTransporteState extends State<ViajeroRentaTransporte> {
  final controllerDiasRentas = TextEditingController();
  final storage = Hive.box('storage');
  ViajeroViewModel addHistorial = ViajeroViewModel();
  @override
  Widget build(BuildContext context) {
    Results data = widget.dataItem;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  child: Row(
                    children: [
                      SizedBox(
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: ColorsBase.colorsecundario,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 350,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: ColorBlurEfect.blur,
                                  offset: Offset(0, 4),
                                  spreadRadius: 3)
                            ]),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/images/avatar/avatar_empresa.png'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 28),
                        alignment: Alignment.center,
                        width: 200,
                        height: 100,
                        child: Text(
                          "${data.id}",
                          overflow: TextOverflow.fade,
                          style: EstiloCardPresionada.labelnombrempresa,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 350,
                      height: 250,
                      decoration: const BoxDecoration(
                        color: ColorsCard.backgroundcardpresionada,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 11,
                              offset: Offset(0, 5),
                              spreadRadius: -1,
                              color: ColorBlurEfect.blur)
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 200,
                                height: 250,
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          height: 170,
                                          child: SvgPicture.asset(
                                              'assets/images/card_pressed/card_car.svg'),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          height: 80,
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 4),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: 20,
                                                          height: 20,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/unidades/car.svg',
                                                            color: ColorsBase
                                                                .colorsecundario,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 170,
                                                      child: Text(
                                                        '${data.modelo}',
                                                        style:
                                                            EstiloCardPresionada
                                                                .labelmodelocar,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        SizedBox(
                                                          width: 30,
                                                          height: 40,
                                                          child: Icon(Icons
                                                              .location_on),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 50,
                                                      width: 168,
                                                      child:
                                                          const SingleChildScrollView(
                                                        child: Text(
                                                          'Calle Segunda Pte. Nte. 342-2, Niño de Atocha, 29037 Tuxtla Gutiérrez, Chis.',
                                                          overflow:
                                                              TextOverflow.fade,
                                                          style:
                                                              EstiloCardPresionada
                                                                  .labelubicacion,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                height: 250,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: SvgPicture.asset(
                                                  'assets/icons/unidades/asiento.svg',
                                                  color: ColorsBase
                                                      .colorsecundario,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  '${data.numAsientos}',
                                                  style: EstiloCardPresionada
                                                      .labelssimilares,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 7, left: 1),
                                      child: Row(
                                        children: [
                                          Column(
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
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  '${data.trasmision}',
                                                  style: EstiloCardPresionada
                                                      .labelssimilares,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 7, left: 1),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: 25,
                                                height: 25,
                                                child: SvgPicture.asset(
                                                  'assets/icons/unidades/ac.svg',
                                                  color: ColorsBase
                                                      .colorsecundario,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  '${data.ac}',
                                                  style: EstiloCardPresionada
                                                      .labelssimilares,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 130,
                                      height: 40,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 15,
                                                height: 15,
                                                child: SvgPicture.asset(
                                                  'assets/icons/unidades/simbolo_peso.svg',
                                                  color:
                                                      ColorsBase.colorprimario,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: Text(
                                                  '${data.precio}.00',
                                                  style: EstiloCardPresionada
                                                      .labelprecio,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                          width: 100,
                                          height: 22,
                                          child: Text(
                                            'Precio proporcionado es unicamente por día',
                                            overflow: TextOverflow.fade,
                                            style:
                                                EstiloCardPresionada.labelaviso,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 125,
                                          height: 50,
                                          child: Image.asset(
                                            'assets/images/card_pressed/cp_logo_paypal.png',
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
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  width: 350,
                  height: 50,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'Dias de renta',
                              style: EstiloCardPresionada.labeldiasrenta,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: TextField(
                              controller: controllerDiasRentas,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorsInput.backgroundinput,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: ColorsInput.borderinput),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: Row(
                    children: const [
                      Text(
                        'Detalles',
                        style: EstiloCardPresionada.labeldetalle,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 350,
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 350,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: ColorsCard.backgroundcardpresionada,
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
                          child: SizedBox(
                            width: 320,
                            height: 80,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                '${data.detalles}',
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.fade,
                                style: EstiloCardPresionada.labeltextodetalle,
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 350,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 350,
                            child: SlideAction(
                              sliderRotate: false,
                              text: 'Desliza para rentar',
                              innerColor: ColorsPago.secundario,
                              outerColor: ColorsPago.primario,
                              sliderButtonIcon: const Icon(
                                Icons.payment,
                                color: ColorsPago.terceario,
                              ),
                              onSubmit: () {
                                if (validar(controllerDiasRentas.text)) {
                                  showConfirmarCompra(data, addHistorial,
                                      controllerDiasRentas.text);
                                } else {
                                  showMensajeError();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showConfirmation() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: 'Hecho',
      text: '¡Renta realizada exitosamente!',
      onConfirmBtnTap: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
  }

  bool validar(String dias) {
    return (dias.isNotEmpty && (int.parse(dias) > 0)) ? true : false;
  }

  void showMensajeError() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: '¡El numero de dias no es valido!',
      onConfirmBtnTap: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Route route = MaterialPageRoute(
          builder: (context) => ViajeroRentaTransporte(
            dataItem: widget.dataItem,
          ),
        );
        Navigator.push(context, route);
      },
    );
  }

  String parseo(int idUser, String nombreEmpresa, String nombre, String fecha,
      int dias, double total) {
    return jsonEncode({
      'idUser': idUser,
      'nombreEmpresa': nombreEmpresa,
      'nombre': nombre,
      'fecha': fecha,
      'dias': dias,
      'total': total,
    });
  }

  void post(
      Results data, ViajeroViewModel addHistorial, double total, int dias) {
    DateTime fecha = DateTime.now();

    addHistorial
        .vmPostHistorialR(parseo(
      int.parse(storage.get(5)),
      "${data.nombreEmpresa}",
      storage.get(1).toString(),
      "${fecha.year}-${fecha.month}-${fecha.day}",
      dias,
      total,
    ))
        .then((value) {
      (value == "200") ? showConfirmation() : showMensajeErrorPost(value);
    }).onError((error, stackTrace) {
      showMensajeErrorPost(error.toString());
    });
  }

  void showMensajeErrorPost(String codigo) {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: '¡Ha ocurrido un error: $codigo!',
    );
  }

  void showConfirmarCompra(
      Results data, ViajeroViewModel addHistorial, String dias) {
    double total = double.parse("${data.precio}.00") * int.parse(dias);
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: "¡Confima tu compra!",
      text:
          'Confirmando tu compra:\nModelo: ${data.modelo} \nA/C: ${data.ac} \n Total de asientos: ${data.numAsientos} \nTotal de dias: $dias\nTotal: ${total}0',
      confirmBtnText: 'Comprar',
      cancelBtnText: 'Cancelar',
      onConfirmBtnTap: () {
        post(data, addHistorial, total, int.parse(dias));
        Navigator.pop(context);
      },
      confirmBtnColor: Colors.green,
    );
  }
}
