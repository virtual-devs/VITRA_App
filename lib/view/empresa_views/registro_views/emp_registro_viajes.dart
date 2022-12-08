import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';
import 'package:vitrapp/util/convert_size.dart';

// ignore: depend_on_referenced_packages
import '../../../alerts/viajero/error.dart';
import '../../../alerts/viajero/error_post.dart';
import '../../../alerts/viajero/ok.dart';
import '../../../styles/colors/colors_botons.dart';
import '../../../styles/fontstyles/estilo_forms.dart';
import '../../../view-model/viajero_view_model.dart';

class RegistroViajes extends StatefulWidget {
  const RegistroViajes({super.key});

  @override
  State<RegistroViajes> createState() => _RegistroViajesState();
}

class _RegistroViajesState extends State<RegistroViajes> {
  final storage = Hive.box('storage');
  ViajeroViewModel viajeroViewModel = ViajeroViewModel();
  TimeOfDay tiempo = const TimeOfDay(hour: 10, minute: 20);
  DateTime fecha = DateTime(2022, 05, 11);
  bool change = false;
  bool completed = false;
  bool changeWidget = false;
  final controllerOrigen = TextEditingController();
  final controllerDestino = TextEditingController();
  final controllerAsientos = TextEditingController();
  final controllerPrecio = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SingleChildScrollView(
          child: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: convertWidth(width, 400),
                height: convertHeight(height, 40),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: ColorsBase.colorsecundario,
                  ),
                ),
              ),
              SizedBox(
                width: convertWidth(width, 350),
                height: convertHeight(height, 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: convertHeight(height, 100),
                      child: Row(
                        children: const [
                          Text(
                            "Registro",
                            style: EstiloLabelsFormulario.titulo,
                          ),
                          Text(
                            " de ",
                            style: EstiloLabelsFormulario.de,
                          ),
                          Text(
                            "viajes",
                            style: EstiloLabelsFormulario.titulo,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: margin(height, 105)),
                    height: convertHeight(height, 430),
                    width: convertWidth(width, 350),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                child: Text(
                                  'Origen',
                                  style: EstiloLabelsFormulario
                                      .labelsprimariosunidades,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: convertWidth(width, 350),
                                height: convertHeight(height, 60),
                                decoration: const BoxDecoration(
                                  color: ColorsInput.backgroundinput,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: TextField(
                                  controller: controllerOrigen,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorsInput.backgroundinput,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: ColorsInput.borderinput),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: convertWidth(width, 340),
                                  child: const Text(
                                    'Destino',
                                    style: EstiloLabelsFormulario
                                        .labelsprimariosunidades,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: convertWidth(width, 350),
                                height: convertHeight(height, 60),
                                decoration: const BoxDecoration(
                                  color: ColorsInput.backgroundinput,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: TextField(
                                  controller: controllerDestino,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorsInput.backgroundinput,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: ColorsInput.borderinput),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: convertWidth(width, 115),
                                  child: const Text(
                                    'Fecha',
                                    style: EstiloLabelsFormulario
                                        .labelsprimariosunidades,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: convertWidth(width, 115),
                                  child: const Text(
                                    'Hora',
                                    style: EstiloLabelsFormulario
                                        .labelsprimariosunidades,
                                  ),
                                ),
                                SizedBox(
                                  width: convertWidth(width, 115),
                                  child: const Text(
                                    'Num de asientos',
                                    textAlign: TextAlign.center,
                                    style: EstiloLabelsFormulario
                                        .labelsprimariosunidades,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: convertWidth(width, 115),
                                height: convertHeight(height, 60),
                                decoration: BoxDecoration(
                                  color: ColorsInput.backgroundinput,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(
                                      color: ColorsInput.borderinput),
                                ),
                                child: (change == false)
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.date_range_outlined,
                                          color: ColorsBase.colorsecundario,
                                        ),
                                        onPressed: () async {
                                          DateTime? nuevaFecha =
                                              await getDate();
                                          if (nuevaFecha == null) return;
                                          setState(() {
                                            fecha = nuevaFecha;
                                            change = true;
                                          });
                                        },
                                      )
                                    : mostrarfecha(width, height),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: convertWidth(width, 113),
                                height: convertHeight(height, 60),
                                decoration: BoxDecoration(
                                    color: ColorsInput.backgroundinput,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                        color: ColorsInput.borderinput)),
                                child: (changeWidget == false)
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.access_time,
                                          color: ColorsBase.colorsecundario,
                                        ),
                                        onPressed: () async {
                                          TimeOfDay? nuevoTiempo =
                                              await getTiempo();
                                          if (nuevoTiempo == null) return;
                                          setState(() {
                                            tiempo = nuevoTiempo;
                                            changeWidget = true;
                                          });
                                        },
                                      )
                                    : mostrarhora(),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: convertWidth(width, 113),
                                height: convertHeight(height, 60),
                                decoration: const BoxDecoration(
                                  color: ColorsInput.backgroundinput,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: TextField(
                                  controller: controllerAsientos,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorsInput.backgroundinput,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                        color: ColorsInput.borderinput,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            width: convertWidth(width, 350),
                            child: Row(
                              children: const [
                                SizedBox(
                                  child: Text(
                                    'Precio',
                                    style: EstiloLabelsFormulario
                                        .labelsprimariosunidades,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                width: convertWidth(width, 340),
                                height: convertHeight(height, 60),
                                decoration: const BoxDecoration(
                                  color: ColorsInput.backgroundinput,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: TextField(
                                  controller: controllerPrecio,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorsInput.backgroundinput,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: ColorsInput.borderinput),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: convertWidth(width, 220),
                    height: convertHeight(height, 60),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: ColorsBotons.registro,
                      ),
                      onPressed: () => {
                        debugPrint(height.toString()),
                        if (verficar(
                          storage.get(5).toString(),
                          controllerOrigen.text,
                          controllerDestino.text,
                          "${fecha.year} ,${fecha.month} ,${fecha.day}",
                          controllerAsientos.text,
                          "auto.jpg",
                          "${tiempo.hour}:${tiempo.minute}",
                          "${controllerPrecio.text}.00",
                        ))
                          {
                            viajeroViewModel
                                .vmPostViajes(
                              jsonBody(
                                storage.get(5).toString(),
                                controllerOrigen.text,
                                controllerDestino.text,
                                "${fecha.year} ,${fecha.month} ,${fecha.day}",
                                controllerAsientos.text,
                                "auto.jpg",
                                "${tiempo.hour}:${tiempo.minute}",
                                "${controllerPrecio.text}.00",
                              ),
                            )
                                .then((value) {
                              if (value == "200") {
                                showMesajeOkViajero(context);
                              } else {
                                showMesajeErroPostViajero(context);
                              }
                            }),
                          }
                        else
                          {showMesajeErrorViajero(context)}
                      },
                      child: const Text(
                        'Registrar',
                        textAlign: TextAlign.center,
                        style: EstiloLabelsFormulario.labeltextboton,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget mostrarfecha(double width, double height) {
    return InkWell(
      onTap: () async {
        DateTime? nuevaFecha = await getDate();
        if (nuevaFecha == null) return;
        setState(() {
          fecha = nuevaFecha;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: convertWidth(width, 115),
        height: convertHeight(height, 60),
        child: Text(
          '${fecha.day}/${fecha.month}/${fecha.year}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Kameron',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget mostrarhora() {
    return InkWell(
      onTap: () async {
        TimeOfDay? nuevoTiempo = await getTiempo();
        if (nuevoTiempo == null) return;
        setState(() {
          tiempo = nuevoTiempo;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: 115,
        height: 60,
        child: Text(
          '${tiempo.hour}:${tiempo.minute}',
          textAlign: TextAlign.center,
          style: EstiloLabelsFormulario.labeldate,
        ),
      ),
    );
  }

  Future<DateTime?> getDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );
  }

  Future<TimeOfDay?> getTiempo() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  String jsonBody(
    String id,
    String origen,
    String destino,
    String fecha,
    String asientos,
    String imagen,
    String hora,
    String precio,
  ) {
    final body = {
      "idEmpresa": id,
      "origen": origen,
      "destino": destino,
      "fecha": fecha,
      "hora": hora,
      "precio": double.parse(precio),
      "asientos": int.parse(asientos),
      "asientosDisp": int.parse(asientos),
      "imagen": imagen
    };
    return jsonEncode(body);
  }

  bool verficar(
    String id,
    String origen,
    String destino,
    String fecha,
    String asientos,
    String imagen,
    String hora,
    String precio,
  ) {
    return (id.isNotEmpty &&
            origen.isNotEmpty &&
            destino.isNotEmpty &&
            fecha.isNotEmpty &&
            asientos.isNotEmpty &&
            imagen.isNotEmpty &&
            hora.isNotEmpty &&
            precio.isNotEmpty &&
            int.parse(asientos) > 0)
        ? true
        : false;
  }
}
