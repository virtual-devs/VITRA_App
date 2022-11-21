import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:vitrapp/data/network/base_api_services.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../app_exeptions.dart';

class NetworkApiService extends BaseApiServices {
  dynamic responseJson;
  @override
  Future getGetApiResponse() async {
    try {
      final response = await http.get(
        Uri.parse("http://44.212.111.181/rentas"),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conexion a internet');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(data) async {
    dynamic reponseJson;

    try {
      http.Response response = await http
          .post(Uri.parse("http://44.212.111.181/rentasAdd"), body: data)
          .timeout(
            const Duration(seconds: 10),
          );
      debugPrint(response.statusCode.toString());
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No hay conexion a internet');
    }
    return reponseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(" ${response.statusCode}");
    }
  }
}
