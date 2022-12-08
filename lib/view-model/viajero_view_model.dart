import 'package:flutter/cupertino.dart';
import 'package:vitrapp/model/historial_renta.dart';
import 'package:vitrapp/model/login.dart';
import 'package:vitrapp/model/perfil.dart';
import 'package:vitrapp/model/viajes.dart';
import 'package:vitrapp/repository/repository.dart';

import '../data/response/api_response.dart';
import '../model/historial_viajes.dart';
import '../model/transporte.dart';

class ViajeroViewModel with ChangeNotifier {
  final empresa = Repository();
  ApiResponseLogin<Login> getLoginResponse = ApiResponseLogin.loading();

  ApiResponse<Transporte> getTransportesResponse = ApiResponse.loading();

  ApiResponse<Transporte> getTransportesHomeResponse = ApiResponse.loading();

  ApiResponseViajes<Viajes> getViajesResponse = ApiResponseViajes.loading();

  ApiResponsePerfil<Perfil> getPerfilResponse = ApiResponsePerfil.loading();

  ApiResponseViajes<Viajes> getViajesFechaResponse =
      ApiResponseViajes.loading();

  ApiResponseHistorialR<HistorialRenta> getHistorialRentaResponse =
      ApiResponseHistorialR.loading();

  ApiResponseHistorialV<HistorialViaje> getHistorialViajeResponse =
      ApiResponseHistorialV.loading();

/*-------------------------------------Metodos--------------------------------------*/
  setAutoListResponse(ApiResponse<Transporte> response) {
    getTransportesResponse = response;
    notifyListeners();
  }

  setPerfilResponse(ApiResponsePerfil<Perfil> responseP) {
    getPerfilResponse = responseP;
    notifyListeners();
  }

  setListResponseLogin(ApiResponseLogin<Login> response) {
    getLoginResponse = response;
    notifyListeners();
  }

  setTransporteHomeResponse(ApiResponse<Transporte> response) {
    getTransportesHomeResponse = response;
    notifyListeners();
  }

  setResponseHistorialRenta(ApiResponseHistorialR<HistorialRenta> response) {
    getHistorialRentaResponse = response;
    notifyListeners();
  }

  setResponseHistorialViaje(ApiResponseHistorialV<HistorialViaje> response) {
    getHistorialViajeResponse = response;
    notifyListeners();
  }

  setListViajesResponse(ApiResponseViajes<Viajes> response) {
    getViajesResponse = response;
    notifyListeners();
  }

  setListaViajesFechaResponse(ApiResponseViajes<Viajes> response) {
    getViajesFechaResponse = response;
    notifyListeners();
  }

/*-------------------------------------GET'S--------------------------------------*/
  Future<void> vmGetTransportes() async {
    getTransportesResponse = ApiResponse.loading();
    await empresa.getAutos().then((value) {
      setAutoListResponse(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setAutoListResponse(
        ApiResponse.error(
          error.toString(),
        ),
      );
    });
  }

  Future<void> vmGetPerfil(String id) async {
    await empresa.getPerfil(id).then((value) {
      setPerfilResponse(ApiResponsePerfil.completed(value));
    });
  }

  Future<void> vmGetTransportesId(String id) async {
    await empresa.getTransporteEmpresa(id).then((value) {
      setAutoListResponse(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setAutoListResponse(
        ApiResponse.error(
          error.toString(),
        ),
      );
    });
  }

  Future<void> vmGetViajesId(String id) async {
    await empresa.getViajesEmpresa(id).then((value) {
      setListViajesResponse(ApiResponseViajes.completed(value));
    }).onError((error, stackTrace) {
      setListViajesResponse(
        ApiResponseViajes.error(
          error.toString(),
        ),
      );
    });
  }

  Future<void> vmGetTransportesHome() async {
    await empresa.getAutos().then((value) {
      setTransporteHomeResponse(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setTransporteHomeResponse(
        ApiResponse.error(
          error.toString(),
        ),
      );
    });
  }

  Future<void> vmGetTransportesFiltro(
      String asientos, String trasmision, String aire) async {
    await empresa
        .getTransportesFiltro(asientos, trasmision, aire)
        .then((value) {
      setAutoListResponse(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setAutoListResponse(
        ApiResponse.error(
          error.toString(),
        ),
      );
    });
  }

  Future<void> vmGetViajesFiltro(
      String origen, String destino, String fecha) async {
    getViajesResponse = ApiResponseViajes.loading();
    await empresa.getViajesFiltro(origen, destino, fecha).then((value) {
      setListViajesResponse(ApiResponseViajes.completed(value));
    }).onError((error, stackTrace) {
      setListViajesResponse(
        ApiResponseViajes.error(
          error.toString(),
        ),
      );
    });
  }

  Future<void> vmGetViajesFechaHome(String fecha) async {
    await empresa.getViajesFecha(fecha).then((value) {
      setListaViajesFechaResponse(ApiResponseViajes.completed(value));
    }).onError((error, stackTrace) {
      setListaViajesFechaResponse(
        ApiResponseViajes.error(
          error.toString(),
        ),
      );
    });
  }

  Future<void> vmGetHistorialRenta(String url, String id) async {
    await empresa.getHistorialRenta(url, id).then((value) {
      setResponseHistorialRenta(ApiResponseHistorialR.completed(value));
    }).onError((error, stackTrace) {
      setResponseHistorialRenta(ApiResponseHistorialR.error(error.toString()));
    });
  }

  Future<void> vmGetHistorialViaje(String url, String id) async {
    await empresa.getHistorialViaje(url, id).then((value) {
      setResponseHistorialViaje(ApiResponseHistorialV.completed(value));
    }).onError((error, stackTrace) {
      setResponseHistorialViaje(ApiResponseHistorialV.error(error.toString()));
    });
  }

  Future<void> vmGetViajes() async {
    getViajesResponse = ApiResponseViajes.loading();
    await empresa.getViajes().then((value) {
      setListViajesResponse(ApiResponseViajes.completed(value));
    }).onError((error, stackTrace) {
      setListViajesResponse(
        ApiResponseViajes.error(
          error.toString(),
        ),
      );
    });
  }

/*-------------------------------------POST's--------------------------------------*/
  Future<String> vmPostTransporte(String data) async {
    String code = "";
    try {
      await empresa.postTransporte(data).then((value) {
        code = value;
      });
    } catch (e) {
      rethrow;
    }
    return code;
  }

  Future<String> vmPostViajes(String data) async {
    String response = "";
    await empresa.postViajes(data).then((value) {
      response = value;
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
    return response;
  }

  Future<String> vmPostHistorialV(
      String data, String id, String asientos, String dataE) async {
    String statusCode = "";
    await empresa.postHistorialV(data, id, asientos, dataE).then((value) {
      statusCode = value;
    }).onError((error, stackTrace) {});
    return statusCode;
  }

  Future<String> vmPostHistorialR(String data, String id, String dataE) async {
    String statusCodeR = "";
    await empresa.postHistorialR(data, id, dataE).then((value) {
      statusCodeR = value;
    }).onError((error, stackTrace) {});
    return statusCodeR;
  }
/*-------------------------------------PUT's--------------------------------------*/

  Future<String> vmLogout() async {
    String code = "";
    try {
      await empresa.logout().then((value) => code = value);
    } catch (e) {
      rethrow;
    }
    return code;
  }

  Future<String> vmPutViaje(String id, String body) async {
    getViajesResponse = ApiResponseViajes.loading();
    String codePV = "";
    await empresa.putViajes(id, body).then((value) {
      codePV = value;
    }).onError((error, stackTrace) {
      codePV = error.toString();
    });

    return codePV;
  }

  Future<String> vmPutTransporte(String id, String body) async {
    getTransportesResponse = ApiResponse.loading();
    String codePT = "";
    await empresa.putTransporte(id, body).then((value) {
      codePT = value;
    }).onError((error, stackTrace) {
      codePT = error.toString();
    });

    return codePT;
  }

  Future<String> vmPutPerfil(String body, String id) async {
    String code = "";
    try {
      await empresa.putPerfil(body, id).then((value) {
        code = value;
      });
    } catch (e) {
      rethrow;
    }
    return code;
  }

  /*-------------------------------------DELETE's--------------------------------------*/

  Future<String> vmDeleteViaje(String id) async {
    getViajesResponse = ApiResponseViajes.loading();
    String codeDV = "";
    await empresa.deleteViaje(id).then((value) {
      codeDV = value;
    }).onError((error, stackTrace) {
      codeDV = error.toString();
    });

    return codeDV;
  }

  Future<String> vmDeleteTransporte(
    String id,
  ) async {
    getTransportesResponse = ApiResponse.loading();
    String codeDT = "";
    await empresa.deleteTransporte(id).then((value) {
      codeDT = value;
    }).onError((error, stackTrace) {
      codeDT = error.toString();
    });

    return codeDT;
  }

  /*-------------------------------------REGISTER POST's--------------------------------------*/

  Future<String> vmPostRegistro(String body) async {
    dynamic code;
    await empresa.postRegistro(body).then((value) {
      code = value;
    }).onError((error, stackTrace) {
      code = error.toString();
    });
    return "$code";
  }

  /*-------------------------------------REGISTER POST's--------------------------------------*/
  Future<void> vmPostLogin(String body) async {
    try {
      await empresa.postLogin(body).then((value) {
        setListResponseLogin(ApiResponseLogin.completed(value));
      });
    } catch (e) {
      rethrow;
    }
  }
}
