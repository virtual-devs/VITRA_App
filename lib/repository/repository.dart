import 'package:flutter/cupertino.dart';
import 'package:vitrapp/data/network/network_api_services.dart';
import 'package:vitrapp/model/historial_renta.dart';
import 'package:vitrapp/model/login.dart';
import 'package:vitrapp/model/perfil.dart';
import 'package:vitrapp/model/transporte.dart';
import 'package:vitrapp/model/viajes.dart';

import '../model/historial_viajes.dart';

class Repository {
  final NetworkApiService apiServices = NetworkApiService();
/*----------------------------GET'S-----------------------------------------*/
  Future<Transporte> getAutos() async {
    try {
      dynamic responseJ = await apiServices.getApiTransporte();
      responseJ = Transporte.fromJson(responseJ);
      return responseJ;
    } catch (e) {
      rethrow;
    }
  }

  Future<Perfil> getPerfil(String id) async {
    try {
      dynamic responseJ = await apiServices.getApiUsuario(id);
      responseJ = Perfil.fromJson(responseJ);
      return responseJ;
    } catch (e) {
      rethrow;
    }
  }

  Future<Transporte> getTransporteEmpresa(String id) async {
    try {
      dynamic responseJ = await apiServices.getApiTransporteEmpresa(id);
      responseJ = Transporte.fromJsonFecha(responseJ);
      return responseJ;
    } catch (e) {
      rethrow;
    }
  }

  Future<Viajes> getViajesEmpresa(String id) async {
    try {
      dynamic response = await apiServices.getApiViajesEmpresa(id);
      return response = Viajes.fromJsonFiltro(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Viajes> getViajes() async {
    try {
      dynamic response = await apiServices.getGetApiViajes();
      return response = Viajes.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Transporte> getTransportesFiltro(
      String asientos, String trasmision, String aire) async {
    try {
      dynamic respuesta =
          await apiServices.getApiTransportesFiltro(asientos, trasmision, aire);
      return respuesta = Transporte.fromJsonFecha(respuesta);
    } catch (e) {
      rethrow;
    }
  }

  Future<Viajes> getViajesFiltro(
      String origen, String destino, String fecha) async {
    try {
      dynamic respuesta =
          await apiServices.getViajesFiltro(origen, destino, fecha);
      return respuesta = Viajes.fromJsonFiltro(respuesta);
    } catch (e) {
      rethrow;
    }
  }

  Future<Viajes> getViajesFecha(String fecha) async {
    try {
      dynamic respuestaF = await apiServices.getViajesFecha(fecha);
      return respuestaF = Viajes.fromJsonFiltro(respuestaF);
    } catch (e) {
      rethrow;
    }
  }

  Future<HistorialRenta> getHistorialRenta(String url, String id) async {
    try {
      dynamic respuestaHR = await apiServices.getHistorialRenta(url, id);
      return respuestaHR = HistorialRenta.fromJson(respuestaHR);
    } catch (e) {
      rethrow;
    }
  }

  Future<HistorialViaje> getHistorialViaje(String url, String id) async {
    try {
      dynamic respuestaHV = await apiServices.getHistorialViaje(url, id);
      return respuestaHV = HistorialViaje.fromJson(respuestaHV);
    } catch (e) {
      rethrow;
    }
  }

/*-------------------------------------POST's--------------------------------------*/
  Future<String> postHistorialV(
      String data, String id, String asientos, String dataE) async {
    try {
      String responsePH =
          await apiServices.postApiHistorialViajes(data, id, asientos, dataE);
      return responsePH;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> postHistorialR(String data, String id, String dataE) async {
    try {
      String responsePH =
          await apiServices.postApiHistorialRentas(data, id, dataE);
      return responsePH;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> postTransporte(String data) async {
    try {
      String response = await apiServices.postApiTransporte(data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> postViajes(String data) async {
    try {
      dynamic response = await apiServices.postApiViajes(data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  /*----------------------------PUT'S-----------------------------------------*/
  Future<String> putViajes(String id, String body) async {
    try {
      dynamic response = await apiServices.putActulizarViaje(id, body);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> logout() async {
    try {
      dynamic response = await apiServices.logut();
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> putPerfil(String body, String id) async {
    try {
      dynamic response = await apiServices.putApiPerfil(body, id);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> putTransporte(String id, String body) async {
    try {
      dynamic response = await apiServices.putActulizarTransporte(id, body);

      return response;
    } catch (e) {
      rethrow;
    }
  }

/*----------------------------DELTE'S-----------------------------------------*/
  Future<String> deleteTransporte(String id) async {
    try {
      dynamic response = await apiServices.deleteTransporte(id);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> deleteViaje(String id) async {
    try {
      dynamic response = await apiServices.deleteViaje(id);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  /*-------------------------------------REGISTER POST's--------------------------------------*/

  Future<String> postRegistro(String body) async {
    try {
      dynamic response = await apiServices.postRegistro(body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /*-------------------------------------LOGIN POST's--------------------------------------*/
  Future<Login> postLogin(String body) async {
    try {
      dynamic responseL = await apiServices.postLogin(body);
      responseL = Login.fromJson(responseL);
      return responseL;
    } catch (e) {
      rethrow;
    }
  }
}
