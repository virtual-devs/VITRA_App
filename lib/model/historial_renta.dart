class HistorialRenta {
  List<ResultsHistorialRenta>? results;

  HistorialRenta.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      results = <ResultsHistorialRenta>[];
      json['rows'].forEach((data) {
        results!.add(ResultsHistorialRenta.fromJson(data));
      });
    }
  }
}

class ResultsHistorialRenta {
  String? id;
  String? idUser;
  String? nombreEmpresa;
  String? nombre;
  String? fecha;
  String? dias;
  String? total;

  ResultsHistorialRenta({
    this.id,
    this.idUser,
    this.nombreEmpresa,
    this.nombre,
    this.fecha,
    this.dias,
    this.total,
  });

  ResultsHistorialRenta.fromJson(Map<String, dynamic> item) {
    id = item['id'].toString();
    idUser = item['idUser'].toString();
    nombreEmpresa = item['nombreEmpresa'].toString();
    nombre = item['nombre'].toString();
    fecha = item['fecha'].toString();
    dias = item['dias'].toString();
    total = item['total'].toString();
  }
}
