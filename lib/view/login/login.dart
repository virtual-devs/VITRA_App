import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/view-model/viajero_view_model.dart';
import 'package:vitrapp/view/login/logueo.dart';
import 'package:vitrapp/view/login/parseo.dart';
import 'package:vitrapp/view/login/registro_empresa.dart';
import 'package:vitrapp/view/login/registro_viajero.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final storage = Hive.box('storage');
  ViajeroViewModel logueo = ViajeroViewModel();
  bool _isvisible = false;
  bool change = false;
  String username = "";
  String email = "";
  String rol = "";
  String token = "";
  String id = "";

  final controlleremail = TextEditingController();
  final controllerpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 200),
                width: 300,
                height: 550,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Login',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 40, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 300,
                          height: 70,
                          child: Row(children: [
                            SizedBox(
                              width: 30,
                              height: 70,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: const Icon(
                                  Icons.alternate_email,
                                  color: ColorsBase.colorsecundario,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: 270,
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: controlleremail,
                                decoration: InputDecoration(
                                    hintText: 'Correo',
                                    hintStyle: GoogleFonts.averageSans(
                                      fontSize: 18,
                                      color: const Color.fromRGBO(
                                          126, 137, 156, 1),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Color.fromRGBO(226, 228, 231, 1),
                                    ))),
                              ),
                            )
                          ]),
                        ),
                        SizedBox(
                          width: 300,
                          height: 70,
                          child: Row(children: [
                            SizedBox(
                              width: 30,
                              height: 70,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: const Icon(
                                  Icons.lock,
                                  color: ColorsBase.colorsecundario,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: 200,
                              height: 50,
                              child: TextField(
                                controller: controllerpassword,
                                obscureText: _isvisible,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                    hintText: 'Contraseña',
                                    hintStyle: GoogleFonts.averageSans(
                                      fontSize: 18,
                                      color: const Color.fromRGBO(
                                          126, 137, 156, 1),
                                    ),
                                    enabledBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Color.fromRGBO(226, 228, 231, 1),
                                    ))),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              height: 50,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isvisible = !_isvisible;
                                  });
                                },
                                icon: (!_isvisible)
                                    ? const Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Color.fromRGBO(126, 137, 156, 1),
                                      )
                                    : const Icon(
                                        Icons.visibility_off_outlined,
                                        color: Color.fromRGBO(126, 137, 156, 1),
                                      ),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 300,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 115,
                            height: 70,
                            child: Text(
                              '¿Has olividado tu contraseña?',
                              style: GoogleFonts.nunitoSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(221, 83, 80, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 60,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: ColorsBase.colorsecundario,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        onPressed: () {
                          if (validarLogin(controlleremail.text,
                                  controllerpassword.text) &&
                              emailValido(controlleremail.text)) {
                            logueo
                                .vmPostLogin(parseoLogin(controlleremail.text,
                                    controllerpassword.text))
                                .then((value) {
                              username =
                                  "${logueo.getLoginResponse.data!.response![0].username}";
                              email =
                                  "${logueo.getLoginResponse.data!.response![0].email}";
                              rol =
                                  "${logueo.getLoginResponse.data!.response![0].rol}";
                              token =
                                  "${logueo.getLoginResponse.data!.response![0].token}";
                              id =
                                  "${logueo.getLoginResponse.data!.response![0].id}";

                              storage.put(1, username);
                              storage.put(2, email);
                              storage.put(3, rol);
                              storage.put(4, token);
                              storage.put(5, id);
                              routes(context, rol);
                            }).onError((error, stackTrace) {
                              showMesajeErrorLogin(context);
                            });
                          } else {
                            showMesajeErrorLoginCampos(context);
                          }
                        },
                        child: Text(
                          'Iniciar sesión',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 150,
                      height: 40,
                      child: InkWell(
                        onTap: () {
                          Route route = MaterialPageRoute(
                            builder: (context) => const RegistroViajero(),
                          );
                          Navigator.push(context, route);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Viajero? ',
                              style: GoogleFonts.nunitoSans(
                                color: const Color.fromRGBO(126, 137, 156, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Registrate',
                              style: GoogleFonts.nunitoSans(
                                color: const Color.fromRGBO(221, 83, 80, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 300,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 130,
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                              child: Text(
                                'O',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunitoSans(
                                  color: const Color.fromRGBO(126, 137, 156, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 130,
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 150,
                      height: 50,
                      child: InkWell(
                        onTap: () {
                          Route route = MaterialPageRoute(
                            builder: (context) => const RegistroEmpresa(),
                          );
                          Navigator.push(context, route);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Empresa? ',
                              style: GoogleFonts.nunitoSans(
                                color: const Color.fromRGBO(126, 137, 156, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Registrate',
                              style: GoogleFonts.nunitoSans(
                                color: const Color.fromRGBO(221, 83, 80, 1),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
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
}
