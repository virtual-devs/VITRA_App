import 'package:flutter/material.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';
import 'package:vitrapp/styles/fontstyles/estilo_barra_busqueda.dart';
import 'package:vitrapp/styles/fontstyles/estilo_titulo_vitra.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:quickalert/quickalert.dart';
import 'package:vitrapp/util/convert_size.dart';
import 'package:vitrapp/view-model/viajero_view_model.dart';
import 'package:vitrapp/view/alerts/no_data_transporte.dart';
import 'package:vitrapp/view/viajero_views/Items/card_lista_transporte.dart';

import '../../../data/response/status.dart';
import '../../../styles/fontstyles/estilo_forms.dart';

class ViajeroHomeTransporte extends StatefulWidget {
  const ViajeroHomeTransporte({super.key});

  @override
  State<ViajeroHomeTransporte> createState() => _ViajeroHomeTransporteState();
}

class _ViajeroHomeTransporteState extends State<ViajeroHomeTransporte> {
  ViajeroViewModel viajeroViewModel = ViajeroViewModel();
  final controllerAsientos = TextEditingController();
  bool _ac = false;
  bool _trasmision = false;
  late bool _change = true;
  @override
  void initState() {
    viajeroViewModel.vmGetTransportes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: convertWidth(width, 350),
                    child: Row(
                      children: [
                        Column(
                          children: const [
                            Text(
                              'VI',
                              style: EstiloTituloVitra.letrasVIRA,
                            )
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              'T',
                              style: EstiloTituloVitra.letraT,
                            )
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              'RA',
                              style: EstiloTituloVitra.letrasVIRA,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 10),
                              child: const Text(
                                'Transporte',
                                style: EstiloTituloVitra.subtitulo,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: convertWidth(width, 350),
                    height: convertHeight(height, 50),
                    decoration: const BoxDecoration(
                      color: ColorsSearchInput.backgroundinput,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: convertWidth(width, 250),
                              child: const Text(
                                '¡Encuentra tu transporte ideal!',
                                textAlign: TextAlign.center,
                                style: EstiloBarraBusqueda.labelbarrabusqueda,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: convertWidth(width, 100),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: convertWidth(width, 40),
                                        child: IconButton(
                                          onPressed: () =>
                                              _showModalBottomSheet(
                                                  context, width, height),
                                          icon: SvgPicture.asset(
                                            'assets/icons/search/filter.svg',
                                            height: convertHeight(height, 23),
                                            width: convertWidth(width, 23),
                                            color: ColorsBase.colorsecundario,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: convertWidth(width, 50),
                                        child: const Text(
                                          'Filtros',
                                          style:
                                              EstiloBarraBusqueda.labelfiltro,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              RefreshIndicator(
                color: ColorsBase.colorsecundario,
                onRefresh: () async {
                  await viajeroViewModel.vmGetTransportes();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: convertWidth(width, 350),
                      height: convertHeight(height, 538),
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                        color: ColorsCard.background,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: ChangeNotifierProvider<ViajeroViewModel>(
                        create: (context) => viajeroViewModel,
                        child: Consumer<ViajeroViewModel>(
                          builder: (context, value, _) {
                            switch (value.getTransportesResponse.status!) {
                              case Status.LOADING:
                                return const Center(
                                  child: CircularProgressIndicator(
                                      color: ColorsBase.colorsecundario),
                                );
                              case Status.COMPLETED:
                                return (value.getTransportesResponse.data!
                                            .results !=
                                        null)
                                    ? CardListaTransporte(
                                        listResults: value
                                            .getTransportesResponse
                                            .data!
                                            .results!,
                                      )
                                    : nodatatransporte();

                              case Status.ERROR:
                                return Center(
                                  child: Text(value
                                      .getTransportesResponse.message
                                      .toString()),
                                );
                              case Status.INITIAL:
                                return const Center(
                                  child: CircularProgressIndicator(
                                      backgroundColor:
                                          ColorsBase.colorsecundario),
                                );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheet(
      BuildContext context, double width, double height) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.5,
              maxChildSize: 0.8,
              minChildSize: 0.32,
              builder: (context, scrollController) => SingleChildScrollView(
                controller: scrollController,
                child: showModalSheet(setState, width, height),
              ),
            );
          },
        );
      },
    );
  }

  Widget showModalSheet(StateSetter state, double width, double height) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: convertWidth(width, 60),
            height: convertHeight(height, 7),
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
              width: convertWidth(width, 350),
              height: convertHeight(height, 400),
              child: Column(
                children: [
                  SizedBox(
                    width: convertWidth(width, 350),
                    height: convertHeight(height, 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: convertWidth(width, 170),
                          height: convertHeight(height, 60),
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
                              state(() {
                                _trasmision = value!;
                              });
                            },
                            activeColor: ColorsBase.colorsecundario,
                            value: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: convertWidth(width, 170),
                          height: convertHeight(height, 60),
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
                              state(() {
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
                    width: convertWidth(width, 350),
                    height: convertHeight(height, 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: convertWidth(width, 350),
                          height: convertHeight(height, 60),
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
                                width: convertWidth(width, 70),
                                height: convertHeight(height, 58),
                                child: Checkbox(
                                  value: _ac,
                                  shape: const CircleBorder(),
                                  activeColor: ColorsBase.colorsecundario,
                                  onChanged: (value) {
                                    state(() {
                                      _ac = value!;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: convertWidth(width, 28),
                                height: convertWidth(width, 58),
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
                      controller: controllerAsientos,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Ingresa un numero de asientos',
                        filled: true,
                        fillColor: ColorsInput.backgroundinput,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: ColorsInput.borderinput),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    width: convertWidth(width, 300),
                    height: convertHeight(height, 50),
                    child: ElevatedButton(
                      onPressed: () {
                        var trasmision =
                            (_trasmision == true) ? "Estandar" : "Automatico";
                        var aire = (_ac == true) ? "Si" : "No";
                        if (validar(controllerAsientos.text) && _change) {
                          viajeroViewModel.vmGetTransportesFiltro(
                              controllerAsientos.text,
                              trasmision.toString(),
                              aire.toString());
                          state(() {
                            _change = !_change;
                          });
                          Navigator.pop(context);
                        } else if (!_change) {
                          viajeroViewModel.vmGetTransportes();
                          _ac = false;
                          _trasmision = false;
                          state(() {
                            _change = true;
                          });
                          controllerAsientos.text = '';
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsBase.colorsecundario,
                      ),
                      child: Text(
                        (_change) ? 'Aplicar filtros' : 'Quitar filtros',
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

  bool validar(String asientos) {
    if (asientos.isNotEmpty && (int.parse(asientos) > 0)) {
      return true;
    }
    showMensajeError();
    return false;
  }

  void showMensajeError() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: '¡El numero ingresado no es valido!',
      onConfirmBtnTap: () {
        Navigator.pop(context);
      },
    );
  }
}
