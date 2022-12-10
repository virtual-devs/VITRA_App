import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/fontstyles/estilo_registro.dart';
import 'package:vitrapp/util/convert_size.dart';
import 'package:vitrapp/view/login/parseo.dart';
import 'package:vitrapp/view/login/registro_viajero.dart';

import '../../styles/colors/colors_base.dart';
import '../../view-model/viajero_view_model.dart';

class RegistroEmpresa extends StatefulWidget {
  const RegistroEmpresa({super.key});

  @override
  State<RegistroEmpresa> createState() => _RegistroEmpresaState();
}

class _RegistroEmpresaState extends State<RegistroEmpresa> {
  ViajeroViewModel add = ViajeroViewModel();
  bool _isvisible = false;
  final controlleruser = TextEditingController();
  final controllerpassword = TextEditingController();
  final controlleremail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          color: ColorBlurEfect.blur)
                    ]),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                        'assets/images/registro/registro_empresa.jpg'),
                  ),
                  Positioned(
                    top: 90,
                    left: 20,
                    child: Text(
                      'Empresa',
                      style: EstiloLabelsRegistro.titulo,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.arrow_left,
                        size: 30,
                      ),
                      color: ColorsBase.colorprimario,
                    ),
                  )
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: margin(height, 90)),
                width: convertWidth(width, 300),
                height: convertHeight(height, 70),
                child: Row(children: [
                  SizedBox(
                    width: convertWidth(width, 40),
                    height: convertHeight(height, 70),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Icon(
                        CupertinoIcons.person,
                        color: ColorsBase.colorsecundario,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: convertWidth(width, 259),
                    height: convertHeight(height, 50),
                    child: TextField(
                      controller: controlleruser,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                          hintText: 'Empresa',
                          hintStyle: GoogleFonts.averageSans(
                            fontSize: 18,
                            color: const Color.fromRGBO(126, 137, 156, 1),
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
                width: convertWidth(width, 300),
                height: convertHeight(height, 70),
                child: Row(children: [
                  SizedBox(
                    width: convertWidth(width, 40),
                    height: convertHeight(height, 70),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Icon(
                        CupertinoIcons.at,
                        color: ColorsBase.colorsecundario,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: convertWidth(width, 259),
                    height: convertHeight(height, 50),
                    child: TextField(
                      controller: controlleremail,
                      keyboardType: TextInputType.emailAddress,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                          hintText: 'Correo',
                          hintStyle: GoogleFonts.averageSans(
                            fontSize: 18,
                            color: const Color.fromRGBO(126, 137, 156, 1),
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
                width: convertWidth(width, 300),
                height: convertHeight(height, 70),
                child: Row(
                  children: [
                    SizedBox(
                      width: convertWidth(width, 40),
                      height: convertHeight(height, 70),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Icon(
                          CupertinoIcons.lock,
                          color: ColorsBase.colorsecundario,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: convertWidth(width, 220),
                      height: convertHeight(height, 50),
                      child: TextField(
                        controller: controllerpassword,
                        obscureText: _isvisible,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            hintText: 'Contraseña',
                            hintStyle: GoogleFonts.averageSans(
                              fontSize: 18,
                              color: const Color.fromRGBO(126, 137, 156, 1),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Color.fromRGBO(226, 228, 231, 1),
                            ))),
                      ),
                    ),
                    SizedBox(
                      width: convertWidth(width, 40),
                      height: convertHeight(height, 50),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _isvisible = !_isvisible;
                          });
                        },
                        icon: (!_isvisible)
                            ? const Icon(
                                CupertinoIcons.eye,
                                color: Color.fromRGBO(126, 137, 156, 1),
                              )
                            : const Icon(
                                CupertinoIcons.eye_slash,
                                color: Color.fromRGBO(126, 137, 156, 1),
                              ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: convertWidth(width, 350),
                height: convertHeight(height, 70),
                child: Column(
                  children: [
                    SizedBox(
                      width: convertWidth(width, 350),
                      child: Row(
                        children: [
                          SizedBox(
                            width: convertWidth(width, 193),
                            child: Text(
                              'Al registrarse, acepta nuestros',
                              style: EstiloLabelsRegistro.avisoPrimario,
                            ),
                          ),
                          SizedBox(
                            width: convertWidth(width, 150),
                            child: InkWell(
                              onTap: (() {}),
                              child: Text(
                                'Terminos y Condiciones',
                                style: EstiloLabelsRegistro.avisoSecundario,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1,
                            child: Text(
                              ' y',
                              style: EstiloLabelsRegistro.avisoPrimario,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: convertWidth(width, 350),
                      child: Row(
                        children: [
                          SizedBox(
                            width: convertWidth(width, 150),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                'Politicas de privacidad.',
                                style: EstiloLabelsRegistro.avisoSecundario,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: convertWidth(width, 300),
                height: convertHeight(height, 50),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorsBase.colorsecundario,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {
                    if (validar(controlleruser.text, controllerpassword.text,
                            controlleremail.text) &&
                        emailValido(controlleremail.text)) {
                      add
                          .vmPostRegistro(parseo(
                              controlleruser.text,
                              controllerpassword.text,
                              controlleremail.text,
                              "arrendador"))
                          .then((value) {
                        (value.compareTo("200") == 0)
                            ? showMesajePerfilAgregado(context)
                            : showMesajeErrorRegistro(context, value);
                      }).onError((error, stackTrace) {
                        showMesajeErroPostRegistro(context);
                      });
                    } else {
                      showMesajeErrorCamposRegistro(context);
                    }
                  },
                  child: Text(
                    'Registrarse',
                    style: GoogleFonts.nunitoSans(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                width: convertWidth(width, 123),
                height: convertHeight(height, 30),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
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
                        style: EstiloLabelsRegistro.viajero,
                      ),
                      Text(
                        'Registrate',
                        style: EstiloLabelsRegistro.avisoSecundario,
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
