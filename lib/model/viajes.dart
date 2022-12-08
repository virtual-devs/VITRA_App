class Viajes {
  List<ResultsViajes>? results;
  Viajes.fromJson(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      results = <ResultsViajes>[];
      json['rows'].forEach((data) {
        results!.add(ResultsViajes.fromJson(data));
      });
    }
  }

  Viajes.fromJsonFiltro(Map<String, dynamic> json) {
    if (json['rows'] != null) {
      results = <ResultsViajes>[];
      json['rows'].forEach((data) {
        results!.add(ResultsViajes.fromJson(data));
      });
    }
  }
}

class ResultsViajes {
  String? nombreEmpresa;
  String? origen;
  String? destino;
  String? fecha;
  String? hora;
  String? precio;
  String? asientos;
  String? asientosDisp;
  String? imagen;
  String? id;

  ResultsViajes({
    this.nombreEmpresa,
    this.origen,
    this.destino,
    this.fecha,
    this.hora,
    this.precio,
    this.asientos,
    this.asientosDisp,
    this.imagen,
    this.id,
  });

  ResultsViajes.fromJson(Map<String, dynamic> item) {
    nombreEmpresa = item['idEmpresa'].toString();
    origen = item['origen'];
    destino = item['destino'];
    fecha = item['fecha'];
    hora = item['hora'];
    precio = item['precio'].toString();
    asientos = item['asientos'].toString();
    asientosDisp = item['asientosDisp'].toString();
    imagen = item['imagen'];
    id = item['id'].toString();
  }
}
