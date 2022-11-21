import 'package:flutter/cupertino.dart';
import 'package:vitrapp/repository/repository.dart';

import '../data/response/api_response.dart';
import '../model/transporte.dart';

class ViajeroViewModel with ChangeNotifier {
  final autosRenta = Repository();

  ApiResponse<Transporte> autoRentaListResponse = ApiResponse.loading();
  ApiResponse<Transporte> addTransporteResponse = ApiResponse.initial();

  setAutoList(ApiResponse<Transporte> response) {
    autoRentaListResponse = response;
    notifyListeners();
  }

  Future<void> buscarAutosRentaList() async {
    await autosRenta.getAutosRenta().then((value) {
      setAutoList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setAutoList(
        ApiResponse.error(
          error.toString(),
        ),
      );
    });
  }

  Future<void> addTransporte(dynamic data) async {
    await autosRenta.postTransporte(data).then((value) {
      setAutoList(ApiResponse.completed(data));
    }).onError(
      (error, stackTrace) {
        debugPrint(error.toString());
        setAutoList(
          ApiResponse.error(
            error.toString(),
          ),
        );
      },
    );
  }
}
