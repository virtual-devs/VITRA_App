class Transporte {
  List<Results>? results;

  Transporte.fromJson(List<dynamic> json) {
    if (json.isNotEmpty) {
      results = <Results>[];
      for (var value in json) {
        results!.add(Results.fromJson(value));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((datos) => datos.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? nombreEmpresa;
  String? trasmision;
  String? ac;
  String? numAsientos;
  String? urlFoto;
  String? modelo;
  String? precio;
  String? detalles;
  String? disponible;
  String? id;

  Results({
    this.nombreEmpresa,
    this.trasmision,
    this.ac,
    this.numAsientos,
    this.urlFoto,
    this.modelo,
    this.precio,
    this.detalles,
    this.disponible,
    this.id,
  });

  Results.fromJson(Map<String, dynamic> item) {
    nombreEmpresa = item['idEmpresa'].toString();
    trasmision = item['transmision'];
    ac = item['aire'];
    numAsientos = item['asientos'].toString();
    urlFoto = item['imagen'];
    modelo = item['modelo'];    
    precio = item['precio'].toString();
    detalles = item['detalles'];
    disponible = item['disponible'];
    id = item['id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['nombreEmpresa'] = nombreEmpresa;
    data['trasmision'] = trasmision;
    data['ac'] = ac;
    data['numAsientos'] = numAsientos;
    data['urlFoto'] = urlFoto;
    data['modelo'] = modelo;
    data['precio'] = precio;

    return data;
  }
}
