class HistorialViaje {
  List<ResultsHistorialViaje>? results;

  HistorialViaje.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      results = <ResultsHistorialViaje>[];
      json['rows'].forEach((data) {
        results!.add(ResultsHistorialViaje.fromJson(data));
      });
    }
  }
}

class ResultsHistorialViaje {
  String? id;
  String? idUser;
  String? nombreEmpresa;
  String? nombre;
  String? fecha;
  String? hora;
  String? fechaSalida;
  String? horaSalida;
  String? origen;
  String? destino;
  String? total;

  ResultsHistorialViaje({
    this.id,
    this.idUser,
    this.nombreEmpresa,
    this.nombre,
    this.fecha,
    this.hora,
    this.fechaSalida,
    this.horaSalida,
    this.origen,
    this.destino,
    this.total,
  });

  ResultsHistorialViaje.fromJson(Map<String, dynamic> item) {
    id = item['id'].toString();
    idUser = item['idUser'].toString();
    nombreEmpresa = item['nombreEmpresa'].toString();
    nombre = item['nombre'].toString();
    fecha = item['fecha'].toString();
    hora = item['hora'].toString();
    fechaSalida = item['fechaSalida'].toString();
    horaSalida = item['horaSalida'].toString();
    origen = item['origen'].toString();
    destino = item['destino'].toString();
    total = item['total'].toString();
  }
}
