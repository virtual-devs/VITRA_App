abstract class BaseApiServices {
  Future<dynamic> getApiTransporte();

  Future<dynamic> postApiTransporte(String data);

  Future<dynamic> getGetApiViajes();

  Future<dynamic> postApiViajes(String data);

  Future<dynamic> getApiTransportesFiltro(
      String asientos, String trasmision, String aire);

  Future<dynamic> getViajesFiltro(String origen, String destino, String fecha);

  Future<dynamic> getViajesFecha(String fecha);

  Future<dynamic> postApiHistorialViajes(
      String body, String id, String asientos, String dataE);

  Future<dynamic> postApiHistorialRentas(String body, String id, String dataE);

  Future<dynamic> getHistorialRenta(String url, String id);

  Future<dynamic> getHistorialViaje(String url, String id);

  Future<dynamic> putActulizarViaje(String id, String body);

  Future<dynamic> putActulizarTransporte(String id, String body);

  Future<dynamic> deleteViaje(String id);

  Future<dynamic> deleteTransporte(String id);

  Future<dynamic> postRegistro(String body);

  Future<dynamic> postLogin(String body);

  Future<dynamic> getApiViajesEmpresa(String id);

  Future<dynamic> getApiTransporteEmpresa(String id);

  Future<dynamic> putApiPerfil(String body, String id);

  Future<dynamic> getApiUsuario(String id);

  Future<dynamic> logut();
}
