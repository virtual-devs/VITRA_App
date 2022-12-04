import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vitrapp/alerts/empresa/ok_viajero.dart';
import 'package:vitrapp/alerts/empresa/error_post.dart';
import 'package:vitrapp/alerts/empresa/error_viajero.dart';
import 'package:vitrapp/model/viajes.dart';

import '../../../styles/colors/colors_base.dart';
import '../../../styles/colors/colors_botons.dart';
import '../../../styles/colors/colors_input.dart';
import '../../../styles/fontstyles/estilo_forms.dart';
import '../../../view-model/viajero_view_model.dart';

class EmpresaEditarViaje extends StatefulWidget {
  final ResultsViajes item;
  const EmpresaEditarViaje({super.key, required this.item});

  @override
  State<EmpresaEditarViaje> createState() => _EmpresaEditarViajeState();
}

class _EmpresaEditarViajeState extends State<EmpresaEditarViaje> {
  ViajeroViewModel viajeroViewModel = ViajeroViewModel();
  TimeOfDay tiempo = const TimeOfDay(hour: 10, minute: 20);
  DateTime fecha = DateTime(2022, 05, 11);
  bool _changeWidgetFecha = false;
  bool _changeWidgetHora = false;
  final controllerOrigen = TextEditingController();
  final controllerDestino = TextEditingController();
  final controllerAsientos = TextEditingController();
  final controllerPrecio = TextEditingController();

  @override
  void initState() {
    final data = widget.item;
    controllerOrigen.text = "${data.origen}";
    controllerDestino.text = "${data.destino}";
    controllerAsientos.text = "${data.asientos}";
    controllerPrecio.text = "${data.precio}";
    _changeWidgetFecha = true;
    _changeWidgetHora = true;
    fecha = _cargarFecha("${data.fecha}");
    tiempo = _cargarHora("${data.hora}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  width: 400,
                  height: 40,
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
                  width: 350,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Row(
                          children: const [
                            Text(
                              "Editar viajes",
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
                      margin: const EdgeInsets.only(top: 105),
                      height: 430,
                      width: 350,
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
                                  width: 350,
                                  height: 60,
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
                                children: const [
                                  SizedBox(
                                    width: 340,
                                    child: Text(
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
                                  width: 350,
                                  height: 60,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 115,
                                    child: Text(
                                      'Fecha',
                                      style: EstiloLabelsFormulario
                                          .labelsprimariosunidades,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 115,
                                    child: const Text(
                                      'Hora',
                                      style: EstiloLabelsFormulario
                                          .labelsprimariosunidades,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 115,
                                    child: Text(
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
                                  width: 115,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: ColorsInput.backgroundinput,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                        color: ColorsInput.borderinput),
                                  ),
                                  child: (_changeWidgetFecha == false)
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
                                              _changeWidgetFecha = true;
                                            });
                                          },
                                        )
                                      : mostrarfecha(),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 113,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: ColorsInput.backgroundinput,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      border: Border.all(
                                          color: ColorsInput.borderinput)),
                                  child: (_changeWidgetHora == false)
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
                                              _changeWidgetHora = true;
                                            });
                                          },
                                        )
                                      : mostrarhora(),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 113,
                                  height: 60,
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
                              width: 340,
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
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 340,
                                  height: 60,
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
                      width: 220,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: ColorsBotons.registro,
                        ),
                        onPressed: () => {
                          if (_validar())
                            {
                              viajeroViewModel
                                  .vmPutViaje("${widget.item.id}", _parseo())
                                  .then((value) {
                                (value.compareTo("200") == 0)
                                    ? showMesajeOk(context)
                                    : showMesajeErrorPost(context);
                              }).onError((error, stackTrace) {
                                showMesajeError(context);
                              })
                            },
                          viajeroViewModel.vmGetViajes()
                        },
                        child: const Text(
                          'Aplicar cambios',
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
        ),
      ),
    );
  }

  Future<DateTime?> getDate() {
    return showDatePicker(
      context: context,
      initialDate: fecha,
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );
  }

  Future<TimeOfDay?> getTiempo() {
    return showTimePicker(
      context: context,
      initialTime: tiempo,
    );
  }

  Widget mostrarfecha() {
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
        width: 115,
        height: 60,
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

  DateTime _cargarFecha(String s) => DateTime.parse(s);

  TimeOfDay _cargarHora(String s) => TimeOfDay(
        hour: int.parse(s.split(":")[0]),
        minute: int.parse(s.split(":")[1]),
      );
  bool _validar() => (controllerOrigen.text.isNotEmpty &&
          controllerDestino.text.isNotEmpty &&
          controllerAsientos.text.isNotEmpty &&
          controllerPrecio.text.isNotEmpty)
      ? true
      : false;
  String _parseo() => jsonEncode({
        "idEmpresa": 1,
        "origen": controllerOrigen.text,
        "destino": controllerDestino.text,
        "fecha": "${fecha.year} ,${fecha.month} ,${fecha.day}",
        "hora": "${tiempo.hour}:${tiempo.minute}",
        "precio": double.parse(controllerPrecio.text),
        "asientos": int.parse(controllerAsientos.text),
        "asientosDisp": int.parse(controllerAsientos.text),
        "imagen": 'assets/images/card_pressed/card_viaje.svg',
      });
}
