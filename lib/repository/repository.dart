import 'package:vitrapp/data/network/network_api_services.dart';
import 'package:vitrapp/model/transporte.dart';

class Repository {
  final NetworkApiService apiServices = NetworkApiService();

  Future<Transporte> getAutosRenta() async {
    try {
      dynamic response = await apiServices.getGetApiResponse();
      return response = Transporte.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Transporte> postTransporte(dynamic data) async {
    try {
      dynamic response = await apiServices.getPostApiResponse(data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
