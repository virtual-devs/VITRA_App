import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';

import '../../../styles/colors/colors_botons.dart';
import '../../../styles/fontstyles/estilo_forms.dart';

class RegistroViajes extends StatefulWidget {
  const RegistroViajes({super.key});

  @override
  State<RegistroViajes> createState() => _RegistroViajesState();
}

class _RegistroViajesState extends State<RegistroViajes> {
  TimeOfDay tiempo = const TimeOfDay(hour: 10, minute: 20);
  DateTime fecha = DateTime(2022, 05, 11);
  bool change = false;
  bool changeWidget = false;
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
                            "viajes",
                            style: EstiloLabelsFormulario.titulo,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 10),
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
                        ),
                      ],
                      border: Border.all(color: ColorsInput.borderinput),
                      color: ColorsInput.backgroundinput,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.image,
                        size: 34,
                      ),
                      onPressed: () {},
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
                                width: 113,
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: ColorsInput.backgroundinput,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: TextField(
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
                      onPressed: () => {},
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
          style: const TextStyle(
            fontFamily: 'Kameron',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
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
    return showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
}
