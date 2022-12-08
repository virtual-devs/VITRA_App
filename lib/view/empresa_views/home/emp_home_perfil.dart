import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vitrapp/model/perfil.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/util/convert_size.dart';
import 'package:vitrapp/view-model/viajero_view_model.dart';
import 'package:vitrapp/view/login/login.dart';
import '../../../data/response/status.dart';
import '../../../styles/colors/colors_input.dart';

class EmpresaPerfil extends StatefulWidget {
  const EmpresaPerfil({super.key});

  @override
  State<EmpresaPerfil> createState() => _EmpresaPerfilState();
}

class _EmpresaPerfilState extends State<EmpresaPerfil> {
  bool change = false;
  ViajeroViewModel get = ViajeroViewModel();
  final controllerCorreo = TextEditingController();
  final controllerNumero = TextEditingController();
  final storage = Hive.box('storage');
  @override
  void initState() {
    get.vmGetPerfil(storage.get(5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: convertHeight(height, 300),
                  child: const CircleAvatar(
                    radius: 200,
                    backgroundImage: AssetImage(
                      'assets/images/avatar/avatar_empresa.png',
                    ),
                  ),
                ),
                Text(storage.get(1)),
                SizedBox(
                  width: convertWidth(width, 370),
                  height: convertHeight(height, 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: convertWidth(width, 60),
                        height: convertHeight(height, 60),
                        child: (!change)
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    change = !change;
                                  });
                                },
                                icon: const Icon(CupertinoIcons.pencil_circle),
                              )
                            : const Text('Editando'),
                      )
                    ],
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async {
                    await get.vmGetPerfil(storage.get(5));
                  },
                  child: ChangeNotifierProvider<ViajeroViewModel>(
                    create: (context) => get,
                    child: Consumer<ViajeroViewModel>(
                      builder: (context, value, _) {
                        switch (value.getPerfilResponse.status!) {
                          case Status.LOADING:
                            return const Center(
                              child: CircularProgressIndicator(
                                color: ColorsBase.colorsecundario,
                              ),
                            );
                          case Status.COMPLETED:
                            return SizedBox(
                              height: convertHeight(height, 250),
                              child: (!change)
                                  ? perfil(
                                      width,
                                      height,
                                      value
                                          .getPerfilResponse.data!.response![0])
                                  : editPerfil(width, height),
                            );

                          case Status.ERROR:
                            return Text('data');
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
                SizedBox(
                  width: convertWidth(width, 100),
                  child: (!change)
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsBase.colorsecundario),
                          onPressed: () {
                            get.vmLogout().then((value) {
                              if (value.compareTo("200") == 0) {
                                storage.clear();
                                Route route = MaterialPageRoute(
                                    builder: (context) => const Login());
                                Navigator.push(context, route);
                              } else {
                                debugPrint("ERROR $value");
                              }
                            }).onError((error, stackTrace) {
                              debugPrint(error.toString());
                            });
                          },
                          child: const Text('Logout'),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsBase.colorsecundario),
                          onPressed: () {
                            if (validar(controllerCorreo.text,
                                    controllerNumero.text) &&
                                change == true) {
                              get
                                  .vmPutPerfil(
                                      parse(controllerCorreo.text,
                                          controllerNumero.text),
                                      storage.get(5))
                                  .then((value) {
                                (value == "200")
                                    ? debugPrint("Actualizado")
                                    : debugPrint("error");
                                setState(() {
                                  controllerCorreo.text = "";
                                  controllerNumero.text = "";
                                });
                              }).onError((error, stackTrace) {
                                debugPrint(error.toString());
                              });
                            } else {}
                            setState(() {
                              change = !change;
                              controllerCorreo.text = "";
                              controllerNumero.text = "";
                            });
                          },
                          child: const Text('Editar'),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget perfil(double width, double height, ResultsPerfil perfil) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: convertWidth(width, 350),
                height: convertHeight(height, 50),
                child: Row(
                  children: [
                    SizedBox(
                      width: convertWidth(width, 99),
                      child: const Text(
                        'Direccion',
                      ),
                    ),
                    SizedBox(
                      width: convertWidth(width, 249),
                      child: (perfil.direccion?.compareTo('null') != 0)
                          ? Text(
                              '${perfil.direccion}',
                            )
                          : const Text('No tienes ninguna direccion agregada'),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: convertWidth(width, 350),
                height: convertHeight(height, 50),
                child: Row(
                  children: [
                    SizedBox(
                      width: convertWidth(width, 99),
                      child: const Text(
                        'Telefono',
                      ),
                    ),
                    SizedBox(
                      width: convertWidth(width, 249),
                      child: (perfil.telefono?.compareTo('null') != 0)
                          ? Text(
                              '${perfil.telefono}',
                            )
                          : const Text('No tienes ningun numero agregado'),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget editPerfil(double width, double height) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: convertWidth(width, 300),
          height: convertHeight(height, 100),
          child: TextField(
            controller: controllerCorreo,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Direccion',
              filled: true,
              fillColor: ColorsInput.backgroundinput,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: ColorsInput.borderinput),
              ),
            ),
          ),
        ),
        SizedBox(
          width: convertWidth(width, 300),
          height: convertHeight(height, 100),
          child: TextField(
            controller: controllerNumero,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Numero telefonico',
              filled: true,
              fillColor: ColorsInput.backgroundinput,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: ColorsInput.borderinput),
              ),
            ),
          ),
        )
      ],
    );
  }

  bool validar(String direccion, String telefono) =>
      (direccion.isNotEmpty && telefono.isNotEmpty) ? true : false;

  String parse(
    String direccion,
    String telefono,
  ) =>
      jsonEncode({'telefono': telefono, 'direccion': direccion});
}
