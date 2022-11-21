import 'package:flutter/material.dart';

import '../../styles/colors/colors_base.dart';
import '../../styles/colors/colors_input.dart';
import '../../styles/fontstyles/estilo_forms.dart';

class ModalSheetTransporte extends StatefulWidget {
  const ModalSheetTransporte({super.key});

  @override
  State<ModalSheetTransporte> createState() => _ModalSheetTransporteState();
}

class _ModalSheetTransporteState extends State<ModalSheetTransporte> {
  bool ac = false;
  bool _trasmision = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              width: 350,
              height: 250,
              child: Column(
                children: [
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: Row(
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
                            border: Border.all(color: ColorsInput.borderinput),
                          ),
                          child: RadioListTile(
                            toggleable: true,
                            title: const Text(
                              'Estandar',
                              style: EstiloLabelsFormulario.labelsradiobox,
                            ),
                            groupValue: _trasmision,
                            onChanged: (value) {
                              setState(() {
                                _trasmision = value!;
                              });
                            },
                            activeColor: ColorsBase.colorsecundario,
                            value: true,
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
                            border: Border.all(color: ColorsInput.borderinput),
                          ),
                          child: RadioListTile(
                            toggleable: true,
                            title: const Text(
                              'Automatico',
                              style: EstiloLabelsFormulario.labelsradiobox,
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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: Row(
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
                            border: Border.all(color: ColorsInput.borderinput),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 58,
                                child: Checkbox(
                                  value: ac,
                                  shape: const CircleBorder(),
                                  activeColor: ColorsBase.colorsecundario,
                                  onChanged: (value) {
                                    setState(() {
                                      ac = value!;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 28,
                                height: 58,
                                child: const Text(
                                  'A/C',
                                  textAlign: TextAlign.center,
                                  style: EstiloLabelsFormulario.labelsradiobox,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsBase.colorsecundario,
                      ),
                      child: const Text(
                        'Aplicar filtros',
                        style: EstiloLabelsFormulario.labeltextboton,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
