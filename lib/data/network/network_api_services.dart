import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vitrapp/data/network/base_api_services.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../app_exeptions.dart';

class NetworkApiService extends BaseApiServices {
  final storage = Hive.box('storage');
  final String mensajeSocketExeption = 'No hay conexion a internet';

  Map<String, String> header() {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'token': storage.get(4).toString()
    };
    return headers;
  }

  Map<String, String> headerLogin() {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    return headers;
  }

  @override
  Future getApiUsuario(String id) async {
    dynamic responseUsuario;
    try {
      final responseE = await http.get(
        Uri.parse("http://3.213.253.209/perfil/$id"),
      );
      responseUsuario = jsonDecode(jsonEncode([returnResponse(responseE)]));
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responseUsuario;
  }

  @override
  Future getApiTransporteEmpresa(String id) async {
    dynamic responseJsonEmpresa;
    try {
      final responseE = await http.get(
        Uri.parse("http://44.212.111.181/rentas/$id"),
      );
      responseJsonEmpresa = returnResponse(responseE);
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responseJsonEmpresa;
  }

  @override
  Future getApiViajesEmpresa(String id) async {
    dynamic responseJsonEmpresa;
    try {
      final responseE = await http.get(
        Uri.parse("http://44.212.111.181/viajes/$id"),
      );
      responseJsonEmpresa = returnResponse(responseE);
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responseJsonEmpresa;
  }

  @override
  Future getApiTransporte() async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse("http://44.212.111.181/rentasDisponibles"),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responseJson;
  }

  @override
  Future getHistorialViaje(String url, String id) async {
    dynamic respuestaHistorialV;
    try {
      final responseV = await http.get(
        Uri.parse("$url$id"),
      );
      respuestaHistorialV = returnResponse(responseV);
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return respuestaHistorialV;
  }

  @override
  Future getHistorialRenta(String url, String id) async {
    dynamic respuestaHistorialR;
    try {
      final responseR = await http.get(
        Uri.parse("$url$id"),
      );
      respuestaHistorialR = returnResponse(responseR);
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return respuestaHistorialR;
  }

  @override
  Future getGetApiViajes() async {
    dynamic responseApiViajes;
    try {
      final response = await http.get(
        Uri.parse("http://44.212.111.181/viajesDisponibles"),
      );
      responseApiViajes = returnResponse(response);
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responseApiViajes;
  }

  @override
  Future getApiTransportesFiltro(
      String asientos, String trasmision, String aire) async {
    dynamic responseApiTransporte;

    try {
      final responseT = await http.get(Uri.parse(
          'http://44.212.111.181/rentas/$asientos/$trasmision/$aire'));
      responseApiTransporte = returnResponse(responseT);
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responseApiTransporte;
  }

  @override
  Future getViajesFiltro(String origen, String destino, String fecha) async {
    dynamic responseApiViajes;

    try {
      final responseV = await http.get(
          Uri.parse('http://44.212.111.181/viajes/$origen/$destino/$fecha'));
      responseApiViajes = returnResponse(responseV);
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responseApiViajes;
  }

  @override
  Future getViajesFecha(String fecha) async {
    dynamic responseApiViajeFecha;
    try {
      final responseVF =
          await http.get(Uri.parse('http://44.212.111.181/viajesFecha/$fecha'));
      responseApiViajeFecha = returnResponse(responseVF);
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responseApiViajeFecha;
  }

/*-------------------------------------POST's--------------------------------------*/
  @override
  Future postApiTransporte(data) async {
    dynamic respuestaJson;

    try {
      final response = await http.post(
        Uri.parse("http://44.212.111.181/rentasAdd"),
        body: data,
        headers: header(),
      );
      respuestaJson = response.statusCode.toString();
      debugPrint("aqui en net ${header()}");
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return respuestaJson;
  }

  @override
  Future postApiViajes(String data) async {
    dynamic respuestaJsonViajes;
    try {
      final response = await http.post(
        Uri.parse("http://44.212.111.181/viajesAdd"),
        body: data,
        headers: header(),
      );

      respuestaJsonViajes = response.statusCode.toString();
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return respuestaJsonViajes;
  }

  @override
  Future postApiHistorialViajes(
      String body, String id, String asientos, String dataE) async {
    dynamic estatusCode;
    try {
      final responsePHV = await http.post(
        Uri.parse('http://52.206.59.43/traveler/historialVAdd'),
        body: body,
        headers: header(),
      );

      final responsePHM = await http.post(
        Uri.parse('http://44.212.111.181/historialVAdd'),
        body: dataE,
        headers: header(),
      );

      final responsePNA = await http.put(
        Uri.parse('http://44.212.111.181/viajesUpdate/$id/$asientos'),
        body: body,
        headers: header(),
      );
      debugPrint(
          "update ${responsePHV.statusCode}${responsePHM.statusCode}${responsePNA.statusCode}");
      estatusCode = (responsePHV.statusCode == 200 &&
              responsePHM.statusCode == 200 &&
              responsePNA.statusCode == 200)
          ? "200"
          : "Error interno";
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return estatusCode;
  }

  @override
  Future postApiHistorialRentas(String body, String id, String dataE) async {
    dynamic estatusCodeR;

    try {
      final responseHRV = await http.post(
        Uri.parse('http://52.206.59.43/traveler/historialRAdd'),
        body: body,
        headers: header(),
      );
      final responseHMR = await http.post(
        Uri.parse('http://44.212.111.181/historialRAdd'),
        body: dataE,
        headers: header(),
      );

      final responsePCE = await http.put(
        Uri.parse('http://44.212.111.181/rentaDispUpdate/$id'),
        body: body,
        headers: header(),
      );
      estatusCodeR = (responseHRV.statusCode == 200 &&
              responseHMR.statusCode == 200 &&
              responsePCE.statusCode == 200)
          ? "200"
          : "Error interno";
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return estatusCodeR;
  }

/*------------------------------DELETE's----------------------------------------------*/
  @override
  Future deleteTransporte(String id) async {
    dynamic responseDeleteR;
    try {
      final responseDR = await http.delete(
        Uri.parse('http://44.212.111.181/rentasRemove/$id'),
        headers: header(),
      );
      responseDeleteR = "${responseDR.statusCode}";
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responseDeleteR;
  }

  @override
  Future deleteViaje(String id) async {
    dynamic responseDeleteV;
    try {
      final responseDV = await http.delete(
        Uri.parse('http://44.212.111.181/viajesRemove/$id'),
        headers: header(),
      );
      responseDeleteV = "${responseDV.statusCode}";
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responseDeleteV;
  }

  /*------------------------------PUT's----------------------------------------------*/

  @override
  Future logut() async {
    dynamic response;
    try {
      final responseLogut = await http.put(
          Uri.parse(
            'http://3.213.253.209/logout',
          ),
          headers: header());
      response = responseLogut.statusCode.toString();
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return response;
  }

  @override
  Future putActulizarTransporte(String id, String body) async {
    dynamic responsePutR;
    try {
      final responsePR = await http.put(
        Uri.parse('http://44.212.111.181/rentasUpdate/$id'),
        body: body,
        headers: header(),
      );
      responsePutR = "${responsePR.statusCode}";
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responsePutR;
  }

  @override
  Future putActulizarViaje(String id, String body) async {
    dynamic responsePutV;
    try {
      final responsePV = await http.put(
        Uri.parse('http://44.212.111.181/viajesUpdate/$id'),
        body: body,
        headers: header(),
      );
      responsePutV = "${responsePV.statusCode}";
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responsePutV;
  }

  @override
  Future putApiPerfil(String body, String id) async {
    dynamic responsePutP;
    try {
      final responsePV = await http.put(
        Uri.parse('http://3.213.253.209/usuarioUpdate/$id'),
        body: body,
        headers: header(),
      );
      debugPrint(responsePV.statusCode.toString());
      responsePutP = "${responsePV.statusCode}";
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responsePutP;
  }

  /*------------------------------POST'S REGISTER----------------------------------------------*/
  @override
  Future postRegistro(String body) async {
    dynamic code;

    try {
      final response = await http.post(
        Uri.parse("http://3.213.253.209/signUp"),
        body: body,
        headers: headerLogin(),
      );

      final perfil = (jsonDecode(response.body));
      await http.post(
        Uri.parse("http://3.213.253.209/usuarioAdd"),
        body: jsonEncode({
          'idUsuario': perfil["id"],
          'nombre': perfil['username'],
          'telefono': null,
          'direccion': null
        }),
        headers: headerLogin(),
      );
      code = response.statusCode.toString();
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return code;
  }

/*------------------------------POST'S LOGIN----------------------------------------------*/
  @override
  Future postLogin(String body) async {
    dynamic responseLogin;
    try {
      final responsePL = await http.post(
        Uri.parse("http://3.213.253.209/signIn"),
        body: body,
        headers: headerLogin(),
      );
      responseLogin = returnResponse(responsePL);
      String parse = jsonEncode([responseLogin]);
      responseLogin = jsonDecode(parse);
    } on SocketException {
      throw FetchDataException(mensajeSocketExeption);
    }
    return responseLogin;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 404:
      throw BadRequestException(response.body.toString());
    case 500:
      throw BadRequestException(response.body.toString());
    default:
      throw FetchDataException(" ${response.statusCode}");
  }
}
