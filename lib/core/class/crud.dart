import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_weather_app_with_getx/core/class/status_request.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, dynamic>> getData(String linkurl) async {
    try {
      var response = await http.get(Uri.parse(linkurl));
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var responsebody = jsonDecode(response.body);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, dynamic>> postData(
      String linkUrl, Map data) async {
    try {
      var response = await http.post(Uri.parse(linkUrl), body: data);
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        print(responseBody);
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
