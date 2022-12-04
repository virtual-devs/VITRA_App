import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vitrapp/alerts/empresa/error_post.dart';
import 'package:vitrapp/alerts/empresa/ok_viajero.dart';
import 'package:vitrapp/model/transporte.dart';
import 'package:vitrapp/view-model/viajero_view_model.dart';

import '../../../styles/colors/colors_base.dart';
import '../../../styles/colors/colors_botons.dart';
import '../../../styles/colors/colors_input.dart';
import '../../../styles/fontstyles/estilo_forms.dart';

class EmpresaEditarTransporte extends StatefulWidget {
  final Results item;
  final ViajeroViewModel edit;
  const EmpresaEditarTransporte(
      {super.key, required this.item, required this.edit});

  @override
  State<EmpresaEditarTransporte> createState() =>
      _EmpresaEditarTransporteState();
}

class _EmpresaEditarTransporteState extends State<EmpresaEditarTransporte> {
  bool _ac = false;
  bool _trasmision = false;
  final String foto = "assets/images/card_pressed/card_car.svg";
  final String estatus = "Disponible";
  final modelController = TextEditingController();
  final asientosController = TextEditingController();
  final precioController = TextEditingController();
  final detallesController = TextEditingController();

  @override
  void initState() {
    final data = widget.item;
    modelController.text = "${data.modelo}";
    asientosController.text = "${data.numAsientos}";
    precioController.text = "${data.precio}";
    detallesController.text = "${data.detalles}";
    _trasmision = _trasmisionSelected("${data.trasmision}");
    _ac = _acSelected("${data.ac}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
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
                              "Editar unidades",
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
                      margin: const EdgeInsets.only(top: 100),
                      height: 400,
                      width: 350,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                SizedBox(
                                  child: Text(
                                    'Trasmisión',
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
                                  width: 170,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: ColorsInput.backgroundinput,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                        color: ColorsInput.borderinput),
                                  ),
                                  child: RadioListTile(
                                    toggleable: true,
                                    title: const Text(
                                      'Estandar',
                                      style:
                                          EstiloLabelsFormulario.labelsradiobox,
                                    ),
                                    groupValue: _trasmision,
                                    onChanged: (value) {
                                      setState(() {
                                        _trasmision = value!;
                                      });
                                    },
                                    activeColor: ColorsBase.colorsecundario,
                                    value: false,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 170,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: ColorsInput.backgroundinput,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                        color: ColorsInput.borderinput),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: 168,
                                        child: RadioListTile(
                                          toggleable: true,
                                          title: const Text(
                                            'Automatico',
                                            style: EstiloLabelsFormulario
                                                .labelsradiobox,
                                          ),
                                          groupValue: _trasmision,
                                          onChanged: (value) {
                                            setState(() {
                                              _trasmision = value!;
                                            });
                                          },
                                          activeColor:
                                              ColorsBase.colorsecundario,
                                          value: true,
                                        ),
                                      )
                                    ],
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
                                      'A/C',
                                      style: EstiloLabelsFormulario
                                          .labelsprimariosunidades,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 170,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: ColorsInput.backgroundinput,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                        color: ColorsInput.borderinput),
                                  ),
                                  child: RadioListTile(
                                    toggleable: true,
                                    title: const Text(
                                      'Si',
                                      style:
                                          EstiloLabelsFormulario.labelsradiobox,
                                    ),
                                    groupValue: _ac,
                                    onChanged: (value) {
                                      setState(() {
                                        _ac = value!;
                                      });
                                    },
                                    activeColor: ColorsBase.colorsecundario,
                                    value: false,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 170,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: ColorsInput.backgroundinput,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                        color: ColorsInput.borderinput),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: 168,
                                        child: RadioListTile(
                                          toggleable: true,
                                          title: const Text(
                                            'No',
                                            style: EstiloLabelsFormulario
                                                .labelsradiobox,
                                          ),
                                          groupValue: _ac,
                                          onChanged: (value) {
                                            setState(() {
                                              _ac = value!;
                                            });
                                          },
                                          activeColor:
                                              ColorsBase.colorsecundario,
                                          value: true,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 170,
                                    child: Text(
                                      'Modelo',
                                      style: EstiloLabelsFormulario
                                          .labelsprimariosunidades,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 170,
                                    child: const Text(
                                      'Numero de asientos',
                                      style: EstiloLabelsFormulario
                                          .labelsprimariosunidades,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 170,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: ColorsInput.backgroundinput,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: TextField(
                                    controller: modelController,
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
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 170,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: ColorsInput.backgroundinput,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: 168,
                                        child: TextField(
                                          controller: asientosController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor:
                                                ColorsInput.backgroundinput,
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
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
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: 340,
                              child: Row(
                                children: const [
                                  SizedBox(
                                    child: Text(
                                      'Precio por día',
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
                                    keyboardType: TextInputType.number,
                                    controller: precioController,
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
                              width: 340,
                              child: Row(
                                children: const [
                                  SizedBox(
                                    child: Text(
                                      'Detalles',
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
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    color: ColorsInput.backgroundinput,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: detallesController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: ColorsInput.backgroundinput,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: const BorderSide(
                                            color: ColorsInput.borderinput),
                                      ),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                    maxLength: 300,
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
                      margin: const EdgeInsets.only(top: 60),
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
                              widget.edit
                                  .vmPutTransporte(
                                      "${widget.item.id}", _encode())
                                  .then((value) {
                                if (value.compareTo("200") == 0) {
                                  showMesajeOk(context);
                                } else {
                                  showMesajeErrorPost(context);
                                }
                              }).onError((error, stackTrace) {
                                showMesajeErrorPost(context);
                              })
                            },
                        },
                        child: const Text(
                          'Editar',
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

  bool _trasmisionSelected(String s) =>
      (s.compareTo("Estandar") == 0) ? false : true;

  bool _acSelected(String s) =>
      (s.compareTo("Si") == 0 || s.compareTo("si") == 0) ? false : true;

  bool _validar() => (modelController.text.isNotEmpty &&
          asientosController.text.isNotEmpty &&
          precioController.text.isNotEmpty &&
          detallesController.text.isNotEmpty)
      ? true
      : false;

  String _encode() {
    final body = {
      "asientos": int.parse(asientosController.text),
      "transmision": (!_trasmision) ? "Estandar" : "Automatico",
      "aire": (!_ac) ? "Si" : "No",
      "modelo": modelController.text,
      "imagen": foto,
      "detalles": detallesController.text,
      "disponible": "disponible",
      "precio": double.parse(precioController.text),
    };
    return jsonEncode(body);
  }
}
