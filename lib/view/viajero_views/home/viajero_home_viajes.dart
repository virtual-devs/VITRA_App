import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_input.dart';
import 'package:vitrapp/styles/fontstyles/estilo_home_viajero.dart';
import 'package:vitrapp/styles/fontstyles/estilo_titulo_vitra.dart';
import 'package:vitrapp/styles/fontstyles/estilo_barra_busqueda.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:vitrapp/util/convert_size.dart';
import 'package:vitrapp/view/alerts/no_data_viajes.dart';
import 'package:vitrapp/view/viajero_views/Items/card_lista_viajes.dart';
import '../../../data/response/status.dart';
import '../../../styles/fontstyles/estilo_forms.dart';
import '../../../view-model/viajero_view_model.dart';
// ignore: depend_on_referenced_packages
import 'package:quickalert/quickalert.dart';

class ViajeroHomeViajes extends StatefulWidget {
  const ViajeroHomeViajes({super.key});

  @override
  State<ViajeroHomeViajes> createState() => _ViajeroHomeViajesState();
}

class _ViajeroHomeViajesState extends State<ViajeroHomeViajes> {
  ViajeroViewModel viajeroViewModel = ViajeroViewModel();
  late bool _change = true;
  DateTime fecha = DateTime.now();
  final controllerOrigen = TextEditingController();
  final controllerDestino = TextEditingController();
  @override
  void initState() {
    viajeroViewModel.vmGetViajes();
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
                                'Viajes',
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
                                '¡Encuentra tu viaje ideal!',
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
                                            height: 23,
                                            width: 23,
                                            color: ColorsBase.colorsecundario,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: convertHeight(height, 50),
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
                  await viajeroViewModel.vmGetViajes();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: convertWidth(width, 350),
                      height: convertHeight(height, 558),
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: ChangeNotifierProvider<ViajeroViewModel>(
                        create: (context) => viajeroViewModel,
                        child: Consumer<ViajeroViewModel>(
                          builder: (context, value, _) {
                            switch (value.getViajesResponse.status!) {
                              case Status.LOADING:
                                return const Center(
                                  child: CircularProgressIndicator(
                                      color: ColorsBase.colorsecundario),
                                );
                              case Status.COMPLETED:
                                return (value.getViajesResponse.data!.results !=
                                        null)
                                    ? CardListaViajes(
                                        listResults: value
                                            .getViajesResponse.data!.results!)
                                    : nodataviajes();
                              case Status.ERROR:
                                return Center(
                                  child: Text(value.getViajesResponse.message
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
              height: convertHeight(height, 350),
              child: Column(
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
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Ingresa tu origen',
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
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Ingresa tu destino',
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
                          width: convertWidth(width, 100),
                          height: convertHeight(height, 60),
                          child: IconButton(
                            icon: const Icon(Icons.calendar_month),
                            onPressed: () async {
                              DateTime? nuevaFecha = await getDate();
                              if (nuevaFecha == null) return;
                              state(() {
                                fecha = nuevaFecha;
                              });
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: convertWidth(width, 247),
                          height: convertHeight(height, 60),
                          child: Text(
                            "${fecha.day}/${fecha.month}/${fecha.year}",
                            style: EstiloLabelsHomeViajero.fecha,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    width: convertWidth(width, 300),
                    height: convertHeight(height, 50),
                    child: ElevatedButton(
                      onPressed: () {
                        var origen = controllerOrigen.text;
                        var destino = controllerDestino.text;
                        if (validar(origen, destino) && _change) {
                          state(() {
                            _change = !_change;
                          });
                          viajeroViewModel.vmGetViajesFiltro(origen, destino,
                              '${fecha.year}-${fecha.month}-${fecha.day}');
                          Navigator.pop(context);
                        } else if (!_change) {
                          viajeroViewModel.vmGetViajes();
                          state(() {
                            _change = true;
                          });
                          controllerOrigen.text = '';
                          controllerDestino.text = '';
                          fecha = DateTime.now();
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsBase.colorsecundario,
                      ),
                      child: Text(
                        (_change) ? 'Aplicar filtros' : 'Eliminar filtros',
                        style: EstiloLabelsFormulario.labeltextboton,
                      ),
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

  bool validar(String origen, String destino) {
    if (origen.isNotEmpty && destino.isNotEmpty) {
      return true;
    }
    showMensajeError();
    return false;
  }

  Future<DateTime?> getDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
    );
  }

  void showMensajeError() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: '¡Los campos no pueden quedar vacios!',
      onConfirmBtnTap: () {
        Navigator.pop(context);
      },
    );
  }
}
