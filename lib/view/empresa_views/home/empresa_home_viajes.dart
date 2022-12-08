import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/util/convert_size.dart';
import 'package:vitrapp/view/alerts/no_data_viajes.dart';

import 'package:vitrapp/view/empresa_views/items/card_viaje.dart';
import 'package:vitrapp/view/empresa_views/registro_views/emp_registro_viajes.dart';
import '../../../data/response/status.dart';
import '../../../styles/colors/colors_base.dart';
import '../../../styles/colors/colors_input.dart';
import '../../../styles/fontstyles/estilo_ empresa.dart';
import '../../../view-model/viajero_view_model.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class EmpresaHomeViaje extends StatefulWidget {
  const EmpresaHomeViaje({super.key});

  @override
  State<EmpresaHomeViaje> createState() => _EmpresaHomeViajeState();
}

class _EmpresaHomeViajeState extends State<EmpresaHomeViaje> {
  ViajeroViewModel viajeroViewModel = ViajeroViewModel();
  final storage = Hive.box('storage');
  @override
  void initState() {
    viajeroViewModel.vmGetViajesId(storage.get(5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsInput.backgroundinput,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  width: width / 1.15,
                  child: Row(
                    children: [
                      SizedBox(
                        width: width / 1.5,
                        child: const Text(
                          'Viajes registrados',
                          style: EstiloLabelsUnidades.titulo,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            'assets/images/avatar/avatar_empresa.png',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RefreshIndicator(
                      color: ColorsBase.colorsecundario,
                      onRefresh: () async {
                        await viajeroViewModel.vmGetViajesId(storage.get(5));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: width / 1.15,
                        height: height / 1.6,
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
                                      color: ColorsBase.colorsecundario,
                                    ),
                                  );
                                case Status.COMPLETED:
                                  return (value.getViajesResponse.data!
                                              .results !=
                                          null)
                                      ? CardViaje(
                                          listViajes: value
                                              .getViajesResponse.data!.results!,
                                          delete: viajeroViewModel,
                                        )
                                      : nodataviajes();

                                case Status.ERROR:
                                  return Center(
                                    child: Text(
                                      value.getViajesResponse.message
                                          .toString(),
                                    ),
                                  );
                                case Status.INITIAL:
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      backgroundColor:
                                          ColorsBase.colorsecundario,
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
                          builder: (context) => const RegistroViajes());
                      Navigator.push(context, route);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsBase.colorsecundario,
                      elevation: 13,
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
                          width: convertWidth(width, 170),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              SizedBox(
                                child: Icon(Icons.add_circle_outline_outlined),
                              ),
                              SizedBox(
                                child: Text(
                                  'Nuevo viaje',
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
      ),
    );
  }
}
