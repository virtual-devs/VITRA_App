import 'package:flutter/material.dart';
import 'package:vitrapp/view/empresa_views/registro_views/emp_registro_unidades.dart';

import '../../styles/colors/colors_input.dart';
import '../../styles/fontstyles/estilo_ empresa.dart';
import '../../view-model/viajero_view_model.dart';

import '../../data/response/status.dart';
import '../../styles/colors/colors_base.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

import 'items/card_unidades.dart';

class EmpresaHomeTransporte extends StatefulWidget {
  const EmpresaHomeTransporte({super.key});

  @override
  State<EmpresaHomeTransporte> createState() => _EmpresaHomeTransporteState();
}

class _EmpresaHomeTransporteState extends State<EmpresaHomeTransporte> {
  ViajeroViewModel viajeroViewModel = ViajeroViewModel();

  @override
  void initState() {
    viajeroViewModel.buscarAutosRentaList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                width: 350,
                child: Row(
                  children: const [
                    SizedBox(
                      width: 270,
                      child: Text(
                        'Unidades registradas',
                        style: EstiloLabelsUnidades.titulo,
                      ),
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(
                        'assets/images/user_profile/profile.jpg',
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
                    height: 500,
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                      color: ColorsInput.backgroundinput,
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
                                  color: ColorsBase.colorsecundario,
                                ),
                              );
                            case Status.COMPLETED:
                              return CardUnidades(
                                listResults:
                                    value.autoRentaListResponse.data!.results!,
                              );

                            case Status.ERROR:
                              return Center(
                                child: Text(
                                  value.autoRentaListResponse.message
                                      .toString(),
                                ),
                              );
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
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 300,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => const RegistroUnidades());
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
                        width: 200,
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
