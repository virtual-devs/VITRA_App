import 'package:flutter/material.dart';

import '../../styles/colors/colors_base.dart';
import '../../styles/colors/colors_input.dart';
import '../../styles/fontstyles/estilo_forms.dart';

class MosdalSheet extends StatefulWidget {
  const MosdalSheet({super.key});

  @override
  State<MosdalSheet> createState() => _MosdalSheetState();
}

class _MosdalSheetState extends State<MosdalSheet> {
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
                              'Hoy',
                              style: EstiloLabelsFormulario.labelsradiobox,
                            ),
                            groupValue: true,
                            onChanged: (value) {
                              setState(() {});
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
                            border: Border.all(color: ColorsInput.borderinput),
                          ),
                          child: RadioListTile(
                            toggleable: true,
                            title: const Text(
                              'Automatico',
                              style: EstiloLabelsFormulario.labelsradiobox,
                            ),
                            groupValue: true,
                            onChanged: (value) {
                              setState(() {});
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
                          child: RadioListTile(
                            toggleable: true,
                            title: const Text(
                              'A/C',
                              style: EstiloLabelsFormulario.labelsradiobox,
                            ),
                            groupValue: true,
                            onChanged: (value) {
                              setState(() {});
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
                            border: Border.all(color: ColorsInput.borderinput),
                          ),
                          child: RadioListTile(
                            toggleable: true,
                            title: const Text(
                              'Estandar',
                              style: EstiloLabelsFormulario.labelsradiobox,
                            ),
                            groupValue: true,
                            onChanged: (value) {
                              setState(() {});
                            },
                            activeColor: ColorsBase.colorsecundario,
                            value: false,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
