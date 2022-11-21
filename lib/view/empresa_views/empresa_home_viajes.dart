import 'package:flutter/material.dart';

import 'package:vitrapp/view/empresa_views/items/card_viaje.dart';
import 'package:vitrapp/view/empresa_views/registro_views/emp_registro_viajes.dart';
import '../../styles/colors/colors_base.dart';
import '../../styles/colors/colors_input.dart';
import '../../styles/fontstyles/estilo_ empresa.dart';
import '../../view-model/viajero_view_model.dart';

class EmpresaHomeViaje extends StatefulWidget {
  const EmpresaHomeViaje({super.key});

  @override
  State<EmpresaHomeViaje> createState() => _EmpresaHomeViajeState();
}

class _EmpresaHomeViajeState extends State<EmpresaHomeViaje> {
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
                        'Viajes registrados',
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
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: const CardViaje(),
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
                        width: 170,
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
    );
  }
}
