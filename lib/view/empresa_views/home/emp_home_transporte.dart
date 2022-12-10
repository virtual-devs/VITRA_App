import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/util/convert_size.dart';
import 'package:vitrapp/view/alerts/no_data_transporte.dart';
import 'package:vitrapp/view/empresa_views/registro_views/emp_registro_transporte.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../styles/colors/colors_base.dart';
import '../../../styles/colors/colors_input.dart';
import '../../../styles/fontstyles/estilo_ empresa.dart';
import '../../../view-model/viajero_view_model.dart';
import '../items/card_unidades.dart';

class EmpresaHomeTransporte extends StatefulWidget {
  const EmpresaHomeTransporte({super.key});

  @override
  State<EmpresaHomeTransporte> createState() => _EmpresaHomeTransporteState();
}

class _EmpresaHomeTransporteState extends State<EmpresaHomeTransporte> {
  ViajeroViewModel viajeroViewModel = ViajeroViewModel();
  final storage = Hive.box('storage');
  @override
  void initState() {
    viajeroViewModel.vmGetTransportesId(storage.get(5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: convertWidth(width, 315),
                child: Row(
                  children: [
                    SizedBox(
                      width: convertWidth(width, 240),
                      child: const Text(
                        'Unidades registradas',
                        style: EstiloLabelsUnidades.titulo,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            'assets/images/avatar/avatar_empresa.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RefreshIndicator(
                    color: ColorsBase.colorsecundario,
                    onRefresh: () async {
                      await viajeroViewModel.vmGetTransportesId(storage.get(5));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: convertWidth(width, 315),
                      height: convertHeight(height, 465),
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
                            switch (value.getTransportesResponse.status!) {
                              case Status.LOADING:
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: ColorsBase.colorsecundario,
                                  ),
                                );
                              case Status.COMPLETED:
                                return (value.getTransportesResponse.data!
                                            .results !=
                                        null)
                                    ? CardUnidades(
                                        listResults: value
                                            .getTransportesResponse
                                            .data!
                                            .results!,
                                        edit: viajeroViewModel,
                                      )
                                    : const Center(
                                        child: Text(
                                            'No tiene ningun transporte agregado'));

                              case Status.ERROR:
                                return nodatatransporte();
                              case Status.INITIAL:
                                return const Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: ColorsBase.colorsecundario,
                                  ),
                                );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: convertWidth(width, 300),
                height: convertHeight(height, 70),
                child: ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => const RegistroTransporte());
                    Navigator.push(context, route);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 13,
                    backgroundColor: ColorsBase.colorsecundario,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: convertWidth(width, 200),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            SizedBox(
                              child: Icon(Icons.add_circle_outline_outlined),
                            ),
                            SizedBox(
                              child: Text(
                                'Nueva unidad',
                                style: EstiloLabelsUnidades.textoboton,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
