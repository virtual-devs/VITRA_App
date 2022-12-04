import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/model/viajes.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';
import 'package:vitrapp/styles/fontstyles/estilo_cards.dart';
// ignore: depend_on_referenced_packages
import 'package:slide_to_act/slide_to_act.dart';
// ignore: depend_on_referenced_packages
import 'package:quickalert/quickalert.dart';
import 'package:vitrapp/view-model/viajero_view_model.dart';
import '../../../../styles/colors/colors_base.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../styles/colors/colors_botons.dart';

class ViajeroCompraViaje extends StatefulWidget {
  final ResultsViajes item;
  const ViajeroCompraViaje({super.key, required this.item});

  @override
  State<ViajeroCompraViaje> createState() => _ViajeroCompraViajeState();
}

class _ViajeroCompraViajeState extends State<ViajeroCompraViaje> {
  ViajeroViewModel addHistorial = ViajeroViewModel();
  final controllerAsientos = TextEditingController();
  final storage = Hive.box('storage');
  @override
  Widget build(BuildContext context) {
    ResultsViajes data = widget.item;
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 400,
                  height: 40,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: ColorsBase.colorsecundario,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 80,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  'assets/images/avatar/avatar_empresa.png'),
                              radius: 40,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 270,
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 180,
                                  height: 80,
                                  alignment: Alignment.center,
                                  child:  Text(
                                    '${data.nombreEmpresa}',
                                    textAlign: TextAlign.center,
                                    style:
                                        EstiloCardPresionada.labelnombrempresa,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 350,
                  height: 250,
                  margin: const EdgeInsets.only(top: 30),
                  decoration: const BoxDecoration(
                    color: ColorsCard.backgroundcardpresionada,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
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
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 320,
                        height: 30,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                'Origen',
                                style:
                                    EstiloLabelsCardPresionadaViajes.primarios,
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                'Destino',
                                textAlign: TextAlign.center,
                                style:
                                    EstiloLabelsCardPresionadaViajes.primarios,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 320,
                        height: 30,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                '${data.origen}',
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                '${data.destino}',
                                textAlign: TextAlign.center,
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 310,
                        height: 30,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 150,
                              height: 30,
                              child: Text(
                                'Fecha',
                                style:
                                    EstiloLabelsCardPresionadaViajes.primarios,
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                'Hora',
                                textAlign: TextAlign.center,
                                style:
                                    EstiloLabelsCardPresionadaViajes.primarios,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 310,
                        height: 30,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 30,
                              child: Text(
                                '${data.fecha}',
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                            SizedBox(
                              width: 160,
                              height: 30,
                              child: Text(
                                '${data.hora}',
                                textAlign: TextAlign.center,
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 310,
                        height: 30,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 100,
                              height: 30,
                              child: SingleChildScrollView(
                                child: Text(
                                  'Asientos disp.',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.fade,
                                  style: EstiloLabelsCardPresionadaViajes
                                      .primarios,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 320,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 80,
                              child: Text(
                                '${data.asientosDisp}',
                                textAlign: TextAlign.center,
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: 10,
                              height: 20,
                              child: SvgPicture.asset(
                                'assets/icons/unidades/simbolo_peso.svg',
                                height: 15,
                                width: 15,
                              ),
                            ),
                            SizedBox(
                              width: 190,
                              height: 70,
                              child: Text(
                                '${data.precio}.00',
                                textAlign: TextAlign.center,
                                style: EstiloLabelsCardPresionadaViajes.precio,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 350,
                  height: 70,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 30,
                        child: Icon(
                          Icons.location_on,
                        ),
                      ),
                      SizedBox(
                        width: 320,
                        height: 100,
                        child: Text(
                          'Calle Segunda Pte. Nte. 342-2, Niño de Atocha, 29037 Tuxtla Gutiérrez, Chis.'
                              .toUpperCase(),
                          style: EstiloLabelsCardPresionadaViajes.ubicacion,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 350,
                  height: 90,
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 350,
                        child: Text(
                          '¿ # de asientos a comprar?',
                          style: EstiloLabelsCardPresionadaViajes.asientos,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 350,
                        height: 60,
                        child: TextField(
                          controller: controllerAsientos,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '0 es un numero no valido',
                            hintStyle: const TextStyle(
                              color: ColorsInput.hinttext,
                            ),
                            filled: true,
                            fillColor: ColorsInput.backgroundinput,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: const BorderSide(
                                  color: ColorsInput.borderinput),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: 350,
                  child: Row(
                    children: [
                      Column(
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
                                    if (validar(controllerAsientos.text)) {
                                      showConfirmarCompra(data, addHistorial,
                                          controllerAsientos.text);
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
      text: '¡Renta compra se ha realizado exitosamente!',
      onConfirmBtnTap: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
  }

  bool validar(String asientos) {
    return (asientos.isNotEmpty &&
            int.parse(asientos) > 0 &&
            int.parse(asientos) <= int.parse("${widget.item.asientosDisp}"))
        ? true
        : false;
  }

  void showMensajeError() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: '¡El numero ingresado no es valido!',
      onConfirmBtnTap: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Route route = MaterialPageRoute(
          builder: (context) => ViajeroCompraViaje(item: widget.item),
        );
        Navigator.push(context, route);
      },
    );
  }

  String parseo(
    int idUser,
    String nombreEmpresa,
    String nombre,
    String fecha,
    String hora,
    String fechaSalida,
    String horaSalida,
    String origen,
    String destino,
    double total,
  ) {
    return jsonEncode({
      'idUser': idUser,
      'nombreEmpresa': nombreEmpresa,
      'nombre': nombre,
      'fecha': fecha,
      'hora': hora,
      'fechaSalida': fechaSalida,
      'horaSalida': horaSalida,
      'origen': origen,
      'destino': destino,
      'total': total,
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

  void post(ResultsViajes data, ViajeroViewModel addHistorial, double total) {
    DateTime fecha = DateTime.now();
    TimeOfDay hora = TimeOfDay.now();

    addHistorial
        .vmPostHistorialV(parseo(
            int.parse(storage.get(5)),
            data.nombreEmpresa.toString(),
            storage.get(1),
            "${fecha.year}-${fecha.month}-${fecha.day}-",
            "${hora.hour}:${hora.minute}",
            convertirfecha(data.fecha.toString()),
            convertirhora(data.hora.toString()),
            data.origen.toString(),
            data.destino.toString(),
            total))
        .then((value) {
      debugPrint(value);
      (value == "200") ? showConfirmation() : showMensajeErrorPost(value);
    }).onError((error, stackTrace) {
      showMensajeErrorPost(error.toString());
    });
  }

  void showConfirmarCompra(
      ResultsViajes data, ViajeroViewModel addHistorial, String asientos) {
    double total = double.parse("${data.precio}.00") * int.parse(asientos);
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: "¡Confima tu compra!",
      text:
          'Confirmando tu compra:\nOrigen: ${data.origen} \nDestino: ${data.destino} \n Total de asientos: $asientos \nTotal: ${total}0',
      confirmBtnText: 'Comprar',
      cancelBtnText: 'Cancelar',
      onConfirmBtnTap: () {
        post(data, addHistorial, total);
        Navigator.pop(context);
      },
      confirmBtnColor: Colors.green,
    );
  }

  String convertirfecha(String f) {
    DateTime fecha = DateTime.parse(f);

    return "${fecha.year}-${fecha.month}-${fecha.day}";
  }

  String convertirhora(String s) {
    TimeOfDay hora = TimeOfDay(
      hour: int.parse(s.split(":")[0]),
      minute: int.parse(s.split(":")[1]),
    );
    return "${hora.hour}:${hora.minute}";
  }
}
