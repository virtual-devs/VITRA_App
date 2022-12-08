class Perfil {
  List<ResultsPerfil>? response;

  Perfil.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      response = <ResultsPerfil>[];
      for (var value in json) {
        response!.add(ResultsPerfil.fromJson(value));
      }
    }
  }
}

class ResultsPerfil {
  String? idUsuario;
  String? nombre;
  String? telefono;
  String? direccion;

  ResultsPerfil({
    this.idUsuario,
    this.nombre,
    this.telefono,
    this.direccion,
  });

  ResultsPerfil.fromJson(Map<String, dynamic> item) {
    idUsuario = item['idUsuario'].toString();
    nombre = item['nombre'];
    telefono = item['telefono'].toString();
    direccion = item['direccion'].toString();
  }
}
