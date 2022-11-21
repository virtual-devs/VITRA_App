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
import 'package:vitrapp/view-model/viajero_view_model.dart';
import 'package:vitrapp/view/modal_sheet/modalsheet_transporte.dart';
import 'package:vitrapp/view/viajero_views/Items/card_home_transporte.dart';
import '../../data/response/status.dart';

class ViajeroHomeTransporte extends StatefulWidget {
  const ViajeroHomeTransporte({super.key});

  @override
  State<ViajeroHomeTransporte> createState() => _ViajeroHomeTransporteState();
}

class _ViajeroHomeTransporteState extends State<ViajeroHomeTransporte> {
  ViajeroViewModel viajeroViewModel = ViajeroViewModel();

  @override
  void initState() {
    viajeroViewModel.buscarAutosRentaList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    width: 350,
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
                    height: 50,
                    width: 350,
                    decoration: const BoxDecoration(
                      color: ColorsSearchInput.backgroundinput,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          width: 40,
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.search,
                                color: ColorsBase.colorsecundario,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: const [
                            SizedBox(
                              width: 170,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Ingresa un modelo',
                                  hintStyle:
                                      EstiloBarraBusqueda.labelbarrabusqueda,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        child: IconButton(
                                          onPressed: () =>
                                              _showModalBottomSheet(context),
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
                                    children: const [
                                      SizedBox(
                                        width: 50,
                                        child: Text(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: 350,
                    height: 538,
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
                          switch (value.autoRentaListResponse.status!) {
                            case Status.LOADING:
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: ColorsBase.colorsecundario),
                              );
                            case Status.COMPLETED:
                              return CardHomeTransporte(
                                  listResults: value
                                      .autoRentaListResponse.data!.results!);

                            case Status.ERROR:
                              return Center(
                                child: Text(value.autoRentaListResponse.message
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
            ],
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.4,
          maxChildSize: 0.9,
          minChildSize: 0.32,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: const ModalSheetTransporte(),
            );
          }),
    );
  }
}
