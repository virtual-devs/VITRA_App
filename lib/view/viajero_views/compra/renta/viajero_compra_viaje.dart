import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vitrapp/model/perfil.dart';
import 'package:vitrapp/model/viajes.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';
import 'package:vitrapp/styles/fontstyles/estilo_cards.dart';
// ignore: depend_on_referenced_packages
import 'package:slide_to_act/slide_to_act.dart';
// ignore: depend_on_referenced_packages
import 'package:quickalert/quickalert.dart';
import 'package:vitrapp/util/convert_size.dart';
import 'package:vitrapp/view-model/viajero_view_model.dart';
import '../../../../data/response/status.dart';
import '../../../../styles/colors/colors_base.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../styles/colors/colors_botons.dart';
import '../../../alerts/viajero/alerts_compra.dart';

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
  void initState() {
    super.initState();
    addHistorial.vmGetPerfil(widget.item.nombreEmpresa!);
  }

  @override
  Widget build(BuildContext context) {
    ResultsViajes data = widget.item;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<ViajeroViewModel>(
      create: (context) => addHistorial,
      child: Consumer<ViajeroViewModel>(
        builder: (context, value, child) {
          switch (value.getPerfilResponse.status!) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.COMPLETED:
              return body(data, value.getPerfilResponse.data!.response![0],
                  width, height);

            case Status.ERROR:
              return const Text('');
            case Status.INITIAL:
              return const Text('');
          }
        },
      ),
    );
  }

  Widget body(
      ResultsViajes data, ResultsPerfil perfil, double width, double height) {
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: convertWidth(width, 400),
                  height: convertHeight(height, 40),
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
                  width: convertWidth(width, 350),
                  height: convertHeight(height, 80),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: convertWidth(width, 80),
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
                            width: convertWidth(width, 268),
                            height: convertHeight(height, 80),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: convertWidth(width, 180),
                                  height: convertHeight(height, 80),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${perfil.nombre}',
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
                  width: convertWidth(width, 350),
                  height: convertHeight(height, 250),
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
                        width: convertWidth(width, 320),
                        height: convertHeight(height, 30),
                        child: Row(
                          children: [
                            SizedBox(
                              width: convertWidth(width, 159),
                              height: convertHeight(height, 30),
                              child: const Text(
                                'Origen',
                                style:
                                    EstiloLabelsCardPresionadaViajes.primarios,
                              ),
                            ),
                            SizedBox(
                              width: convertWidth(width, 159),
                              height: convertHeight(height, 30),
                              child: const Text(
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
                        width: convertWidth(width, 320),
                        height: convertHeight(height, 30),
                        child: Row(
                          children: [
                            SizedBox(
                              width: convertWidth(width, 159),
                              height: convertHeight(height, 30),
                              child: Text(
                                '${data.origen}',
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                            SizedBox(
                              width: convertWidth(width, 159),
                              height: convertHeight(height, 30),
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
                        width: convertWidth(width, 310),
                        height: convertHeight(height, 30),
                        child: Row(
                          children: [
                            SizedBox(
                              width: convertWidth(width, 149),
                              height: convertHeight(height, 30),
                              child: const Text(
                                'Fecha',
                                style:
                                    EstiloLabelsCardPresionadaViajes.primarios,
                              ),
                            ),
                            SizedBox(
                              width: convertWidth(width, 159),
                              height: convertHeight(height, 30),
                              child: const Text(
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
                        width: convertWidth(width, 310),
                        height: convertHeight(height, 30),
                        child: Row(
                          children: [
                            SizedBox(
                              width: convertWidth(width, 149),
                              height: convertHeight(height, 30),
                              child: Text(
                                '${data.fecha}',
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                            SizedBox(
                              width: convertWidth(width, 159),
                              height: convertHeight(height, 30),
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
                        width: convertWidth(width, 310),
                        height: convertHeight(height, 30),
                        child: Row(
                          children: [
                            SizedBox(
                              width: convertWidth(width, 100),
                              height: convertHeight(height, 30),
                              child: const SingleChildScrollView(
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
                        width: convertWidth(width, 320),
                        height: convertHeight(height, 80),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: convertWidth(width, 120),
                              height: convertHeight(height, 80),
                              child: Text(
                                '${data.asientosDisp}',
                                textAlign: TextAlign.center,
                                style: EstiloLabelsCardPresionadaViajes
                                    .secundarios,
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: convertWidth(width, 10),
                              height: convertHeight(height, 20),
                              child: SvgPicture.asset(
                                'assets/icons/unidades/simbolo_peso.svg',
                                height: convertWidth(width, 15),
                                width: convertHeight(height, 15),
                              ),
                            ),
                            SizedBox(
                              width: convertWidth(width, 189),
                              height: convertHeight(height, 70),
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
                  width: convertWidth(width, 350),
                  height: convertHeight(height, 70),
                  child: Row(
                    children: [
                      SizedBox(
                        width: convertWidth(width, 30),
                        child: const Icon(
                          Icons.location_on,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: convertWidth(width, 320),
                        height: convertHeight(height, 100),
                        child: Text(
                          (perfil.direccion?.compareTo('null') == 0)
                              ? "Sin direccion alguna".toUpperCase()
                              : perfil.direccion!.toUpperCase(),
                          style: EstiloLabelsCardPresionadaViajes.ubicacion,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: convertWidth(width, 370),
                  height: convertHeight(height, 40),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: IconButton(
                            onPressed: () async {
                              // ignore: deprecated_member_use
                              if (!await canLaunch(
                                      'whatsapp://send?phone="+52${perfil.telefono}+"&text=') &&
                                  "${perfil.telefono}".compareTo('null') != 0) {
                                // ignore: deprecated_member_use
                                await launch(
                                    'https://wa.me/${perfil.telefono}');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "La empresa no cuenta con numero telefonico")));
                              }
                            },
                            icon: const Icon(
                              Icons.whatsapp,
                              color: Colors.green,
                            )),
                      ),
                      ("${perfil.telefono}".compareTo('null') != 0)
                          ? Text('Contacto por WHATSAPP ${perfil.telefono}')
                          : const Text('Numero no disponible'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: convertWidth(width, 350),
                  height: convertHeight(height, 90),
                  child: Column(
                    children: [
                      SizedBox(
                        width: convertWidth(width, 350),
                        child: const Text(
                          '¿ # de asientos a comprar?',
                          style: EstiloLabelsCardPresionadaViajes.asientos,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: convertWidth(width, 350),
                        height: convertHeight(height, 60),
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
                  margin: const EdgeInsets.only(top: 30, bottom: 10),
                  width: convertWidth(width, 350),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: convertWidth(width, 350),
                                child: SlideAction(
                                  sliderRotate: false,
                                  text: 'Desliza para rentar',
                                  innerColor: ColorsPago.secundario,
                                  outerColor: ColorsPago.primario,
                                  sliderButtonIcon: const Icon(
                                    Icons.payment,
                                    color: ColorsPago.terceario,
                                  ),
                                  onSubmit: () async {
                                    if (validar(controllerAsientos.text)) {
                                      showConfirmarCompra(data, addHistorial,
                                          controllerAsientos.text, perfil);
                                      await addHistorial.vmGetViajes();
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
      confirmBtnText: 'Aceptar',
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

  void post(ResultsViajes data, ViajeroViewModel addHistorial, double total,
      String asientos, ResultsPerfil perfil) {
    DateTime fecha = DateTime.now();
    TimeOfDay hora = TimeOfDay.now();

    addHistorial
        .vmPostHistorialV(
            parseo(
                int.parse(storage.get(5)),
                "${perfil.nombre}",
                storage.get(1),
                "${fecha.year}-${fecha.month}-${fecha.day}-",
                "${hora.hour}:${hora.minute}",
                convertirfecha(data.fecha.toString()),
                convertirhora(data.hora.toString()),
                data.origen.toString(),
                data.destino.toString(),
                total),
            "${data.id}",
            asientos,
            parseo(
                int.parse(data.nombreEmpresa.toString()),
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
      (value == "200")
          ? showConfirmation(context)
          : showMensajeErrorPost(context, value);
    }).onError((error, stackTrace) {
      showMensajeErrorPost(context, error.toString());
    });
  }

  void showConfirmarCompra(ResultsViajes data, ViajeroViewModel addHistorial,
      String asientos, ResultsPerfil perfil) {
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
        post(data, addHistorial, total, asientos, perfil);
        Navigator.pop(context);
      },
      onCancelBtnTap: () {
        Navigator.pop(context);
        showMensajeCancelCompra(context);
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
