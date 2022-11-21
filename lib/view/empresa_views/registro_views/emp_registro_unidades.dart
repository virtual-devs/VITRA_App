import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vitrapp/data/response/status.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_botons.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';
import 'package:vitrapp/styles/fontstyles/estilo_forms.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:vitrapp/view-model/viajero_view_model.dart';

class RegistroUnidades extends StatefulWidget {
  const RegistroUnidades({super.key});

  @override
  State<RegistroUnidades> createState() => _RegistroUnidadesState();
}

class _RegistroUnidadesState extends State<RegistroUnidades> {
  ViajeroViewModel viajeroViewModel = ViajeroViewModel();

  bool _ac = false;
  bool _trasmision = false;
  final String foto = "carro.jpg";
  late String trasmisionSelected = "";
  final String estatus = "Disponible";
  late String aireSelected = "";
  final String acSelected = "";
  final modelController = TextEditingController();
  final asientosController = TextEditingController();
  final precioController = TextEditingController();
  final detallesController = TextEditingController();
  // ignore: unused_field
  File? _image;
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
                              "Registro",
                              style: EstiloLabelsFormulario.titulo,
                            ),
                            Text(
                              " de ",
                              style: EstiloLabelsFormulario.de,
                            ),
                            Text(
                              "unidades",
                              style: EstiloLabelsFormulario.titulo,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Imagen',
                        style: EstiloLabelsFormulario.labelsprimariosunidades,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 170,
                      height: 120,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 9,
                              color: ColorBlurEfect.blur,
                              offset: Offset(0, 3),
                            )
                          ],
                          border: Border.all(color: ColorsInput.borderinput),
                          color: ColorsInput.backgroundinput,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: IconButton(
                        icon: const Icon(
                          Icons.image,
                          size: 34,
                        ),
                        onPressed: () => _imagePicker(ImageSource.gallery),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 340,
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
                    Column(
                      children: [
                        ChangeNotifierProvider<ViajeroViewModel>(
                          create: (context) => viajeroViewModel,
                          child: Consumer<ViajeroViewModel>(
                            builder: (context, value, _) {
                              switch (value.addTransporteResponse.status!) {
                                case Status.LOADING:
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: ColorsBase.colorsecundario,
                                    ),
                                  );
                                case Status.COMPLETED:
                                  return const Center(
                                    child: Text('data'),
                                  );
                                case Status.ERROR:
                                  return Center(
                                    child: Text(
                                      value.autoRentaListResponse.message
                                          .toString(),
                                    ),
                                  );
                                case Status.INITIAL:
                                  return const Center();
                              }
                            },
                          ),
                        )
                      ],
                    ),
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
                          viajeroViewModel.addTransporte(
                            jsonBody(
                                "1",
                                asientosController.text,
                                trasmisionSelected,
                                aireSelected,
                                modelController.text,
                                foto,
                                detallesController.text,
                                estatus,
                                precioController.text),
                          ),
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
        ),
      ),
    );
  }

  Future _imagePicker(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      debugPrint(image.path);
      File? img = File(image.path);
      setState(() {
        _image = img;
      });
    }
  }

  String jsonBody(
    String id,
    String asientos,
    String trasmision,
    String aire,
    String modelo,
    String imagen,
    String detalles,
    String disponible,
    String precio,
  ) {
    aire = (_ac == false) ? "Si" : "No";
    trasmision = (_trasmision == false) ? 'Estandar' : "Automatico";
    var body = {
      "idEmpresa": int.parse(id),
      "asientos": int.parse(asientos),
      "transmision": trasmision,
      "aire": aire,
      "modelo": modelo,
      "imagen": imagen,
      "detalles": detalles,
      "disponible": disponible,
      "precio": int.parse(precio),
    };
    String bodySend = jsonEncode(body);
    debugPrint(bodySend);
    return bodySend;
  }
}
