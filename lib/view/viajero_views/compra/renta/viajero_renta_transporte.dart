import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:vitrapp/model/perfil.dart';
import 'package:vitrapp/model/transporte.dart';
import 'package:vitrapp/styles/colors/colors_base.dart';
import 'package:vitrapp/styles/colors/colors_botons.dart';
import 'package:vitrapp/styles/colors/colors_card.dart';
import 'package:vitrapp/styles/colors/colors_efects.dart';
import 'package:vitrapp/styles/fontstyles/estilo_cards.dart';
// ignore: depend_on_referenced_packages
import 'package:slide_to_act/slide_to_act.dart';
// ignore: depend_on_referenced_packages
import 'package:quickalert/quickalert.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrapp/util/convert_size.dart';
import 'package:vitrapp/view/alerts/empresa/alerts_renta.dart';
import 'package:http/http.dart' as http;
import '../../../../data/response/status.dart';
import '../../../../styles/colors/colors_input.dart';
import '../../../../view-model/viajero_view_model.dart';

class ViajeroRentaTransporte extends StatefulWidget {
  final Results dataItem;
  const ViajeroRentaTransporte({
    super.key,
    required this.dataItem,
  });

  @override
  State<ViajeroRentaTransporte> createState() => _ViajeroRentaTransporteState();
}

class _ViajeroRentaTransporteState extends State<ViajeroRentaTransporte> {
  final controllerDiasRentas = TextEditingController();
  final storage = Hive.box('storage');
  ViajeroViewModel addHistorial = ViajeroViewModel();

  @override
  void initState() {
    addHistorial.vmGetPerfil(widget.dataItem.nombreEmpresa!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Results data = widget.dataItem;
    
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider<ViajeroViewModel>(
      create: (context) => addHistorial,
      child: Consumer<ViajeroViewModel>(
        builder: (context, value, child) {
          switch (value.getPerfilResponse.status!) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.COMPLETED:
              return body(data, value.getPerfilResponse.data!.response![0],width,height);

            case Status.ERROR:
              return const Text('');
            case Status.INITIAL:
              return const Text('');
          }
        },
      ),
    );
  }

  Widget body(Results data, ResultsPerfil perfil,double width,double height) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  width: convertWidth(width, 400),
                  child: Row(
                    children: [
                      SizedBox(
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: ColorsBase.colorsecundario,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: convertWidth(width, 350),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: ColorBlurEfect.blur,
                                  offset: Offset(0, 4),
                                  spreadRadius: 3)
                            ]),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                              'assets/images/avatar/avatar_empresa.png'),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 28),
                        alignment: Alignment.center,
                        width: convertWidth(width, 200),
                        height: convertHeight(height, 100),
                        child: Text(
                          "${perfil.nombre}",
                          overflow: TextOverflow.fade,
                          style: EstiloCardPresionada.labelnombrempresa,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: convertWidth(width, 350),
                      height: convertHeight(height, 250),
                      decoration: const BoxDecoration(
                        color: ColorsCard.backgroundcardpresionada,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 11,
                              offset: Offset(0, 5),
                              spreadRadius: -1,
                              color: ColorBlurEfect.blur)
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: convertWidth(width, 200),
                                height: convertHeight(height, 250),
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: convertWidth(width, 200),
                                          height: convertHeight(height, 170),
                                          child: SvgPicture.asset(
                                              'assets/images/card_pressed/card_car.svg'),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: convertWidth(width, 200),
                                          height: convertHeight(height, 80),
                                          child: Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 4),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: convertWidth(width, 20),
                                                          height: convertHeight(height, 20),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/unidades/car.svg',
                                                            color: ColorsBase
                                                                .colorsecundario,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: convertWidth(width, 170),
                                                      child: Text(
                                                        '${data.modelo}',
                                                        style:
                                                            EstiloCardPresionada
                                                                .labelmodelocar,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: convertWidth(width, 200),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children:  [
                                                        SizedBox(
                                                          width: convertWidth(width, 30),
                                                          height: convertHeight(height, 40),
                                                          child:const Icon(Icons
                                                              .location_on),
                                                        )
                                                      ],
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: convertHeight(height, 50),
                                                      width: convertWidth(width, 168),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Text(
                                                          (perfil.direccion
                                                                      ?.compareTo(
                                                                          'null') ==
                                                                  0)
                                                              ? 'Sin direccion alguna'
                                                              : '${perfil.direccion}',
                                                          overflow:
                                                              TextOverflow.fade,
                                                          style:
                                                              EstiloCardPresionada
                                                                  .labelubicacion,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: convertWidth(width, 150),
                                height: convertHeight(height, 250),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: convertWidth(width, 30),
                                                height: convertHeight(height, 30),
                                                child: SvgPicture.asset(
                                                  'assets/icons/unidades/asiento.svg',
                                                  color: ColorsBase
                                                      .colorsecundario,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  '${data.numAsientos}',
                                                  style: EstiloCardPresionada
                                                      .labelssimilares,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 7, left: 1),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: convertWidth(width, 30),
                                                height: convertHeight(height, 30),
                                                child: SvgPicture.asset(
                                                  'assets/icons/unidades/cambio.svg',
                                                  color: ColorsBase
                                                      .colorsecundario,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                child: Text(
                                                  '${data.trasmision}',
                                                  style: EstiloCardPresionada
                                                      .labelssimilares,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 7, left: 1),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                width: convertWidth(width, 25),
                                                height: convertHeight(height, 25),
                                                child: SvgPicture.asset(
                                                  'assets/icons/unidades/ac.svg',
                                                  color: ColorsBase
                                                      .colorsecundario,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  '${data.ac}',
                                                  style: EstiloCardPresionada
                                                      .labelssimilares,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: convertWidth(width, 130),
                                      height: convertHeight(height, 40),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: convertWidth(width, 15),
                                                height: convertHeight(height, 15),
                                                child: SvgPicture.asset(
                                                  'assets/icons/unidades/simbolo_peso.svg',
                                                  color:
                                                      ColorsBase.colorprimario,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: convertWidth(width, 100),
                                                child: Text(
                                                  '${data.precio}.00',
                                                  style: EstiloCardPresionada
                                                      .labelprecio,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        SizedBox(
                                          width: convertWidth(width, 100),
                                          height: convertHeight(height, 22),
                                          child:const Text(
                                            'Precio proporcionado es unicamente por día',
                                            overflow: TextOverflow.fade,
                                            style:
                                                EstiloCardPresionada.labelaviso,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: convertWidth(width, 125),
                                            height: convertHeight(height, 50),
                                            child: (perfil.direccion
                                                        ?.compareTo('null') ==
                                                    0)
                                                ? const Text(
                                                    'Sin telefono alguno',
                                                    overflow: TextOverflow.fade,
                                                    style: EstiloCardPresionada
                                                        .labelubicacion,
                                                  )
                                                : IconButton(
                                                    onPressed: () async {},
                                                    icon: const Icon(
                                                      Icons.whatsapp,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  width: convertWidth(width, 350),
                  height: convertHeight(height, 50),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          SizedBox(
                            width: convertWidth(width, 100),
                            child:const Text(
                              'Dias de renta',
                              style: EstiloCardPresionada.labeldiasrenta,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: convertWidth(width, 250),
                            height: convertHeight(height, 50),
                            child: TextField(
                              controller: controllerDiasRentas,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorsInput.backgroundinput,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: ColorsInput.borderinput),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: convertWidth(width, 350),
                  child: Row(
                    children: const [
                      Text(
                        'Detalles',
                        style: EstiloCardPresionada.labeldetalle,
                      )
                    ],
                  ),
                ),
                Container(
                  width: convertWidth(width, 350),
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: convertWidth(width, 350),
                          height: convertHeight(height, 100),
                          decoration: const BoxDecoration(
                            color: ColorsCard.backgroundcardpresionada,
                            borderRadius: BorderRadius.all(
                              Radius.circular(9),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 11,
                                offset: Offset(0, 5),
                                spreadRadius: -1,
                                color: ColorBlurEfect.blur,
                              )
                            ],
                          ),
                          child: SizedBox(
                            width: convertWidth(width, 320),
                            height: convertHeight(height, 80),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                '${data.detalles}',
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.fade,
                                style: EstiloCardPresionada.labeltextodetalle,
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: convertWidth(width, 350),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: convertWidth(width, 350),
                            child: SlideAction(
                              sliderRotate: false,
                              text: 'Desliza para rentar',
                              innerColor: ColorsPago.secundario,
                              outerColor: ColorsPago.primario,
                              sliderButtonIcon: const Icon(
                                Icons.payment,
                                color: ColorsPago.terceario,
                              ),
                              onSubmit: () async {
                                if (validar(controllerDiasRentas.text)) {
                                  showConfirmarCompra(data, addHistorial,
                                      controllerDiasRentas.text, perfil);
                                  await addHistorial.vmGetTransportes();
                                } else {
                                  showMensajeError();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validar(String dias) {
    return (dias.isNotEmpty && (int.parse(dias) > 0)) ? true : false;
  }

  void showMensajeError() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: '¡El numero de dias no es valido!',
      confirmBtnText: 'Aceptar',
      onConfirmBtnTap: () {
        Navigator.pop(context);
        Navigator.pop(context);
        Route route = MaterialPageRoute(
          builder: (context) => ViajeroRentaTransporte(
            dataItem: widget.dataItem,
          ),
        );
        Navigator.push(context, route);
      },
    );
  }

  String parseo(int idUser, String nombreEmpresa, String nombre, String fecha,
      int dias, double total) {
    return jsonEncode({
      'idUser': idUser,
      'nombreEmpresa': nombreEmpresa,
      'nombre': nombre,
      'fecha': fecha,
      'dias': dias,
      'total': total,
    });
  }

  void post(Results data, ViajeroViewModel addHistorial, double total, int dias,
      ResultsPerfil perfil) {
    DateTime fecha = DateTime.now();

    addHistorial
        .vmPostHistorialR(
            parseo(
              int.parse(storage.get(5)),
              "${perfil.nombre}",
              storage.get(1).toString(),
              "${fecha.year}-${fecha.month}-${fecha.day}",
              dias,
              total,
            ),
            "${data.id}",
            parseo(
              int.parse("${data.nombreEmpresa}"),
              "${data.nombreEmpresa}",
              storage.get(1).toString(),
              "${fecha.year}-${fecha.month}-${fecha.day}",
              dias,
              total,
            ))
        .then((value) {
      (value == "200")
          ? showConfirmationRenta(context)
          : showMensajeErrorPostRenta(context, value);
    }).onError((error, stackTrace) {
      showMensajeErrorPostRenta(context, error.toString());
    });
  }

  void showConfirmarCompra(Results data, ViajeroViewModel addHistorial,
      String dias, ResultsPerfil perfil) {
    double total = double.parse("${data.precio}.00") * int.parse(dias);
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: "¡Confima tu compra!",
      text:
          'Confirmando tu compra:\nModelo: ${data.modelo} \nA/C: ${data.ac} \n Total de asientos: ${data.numAsientos} \nTotal de dias: $dias\nTotal: ${total}0',
      confirmBtnText: 'Comprar',
      cancelBtnText: 'Cancelar',
      onConfirmBtnTap: () {
        post(data, addHistorial, total, int.parse(dias), perfil);
        Navigator.pop(context);
      },
      onCancelBtnTap: () {
        Navigator.pop(context);
        showMensajeCancelRenta(context);
      },
      confirmBtnColor: Colors.green,
    );
  }
}
