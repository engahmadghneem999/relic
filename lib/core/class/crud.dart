import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:relic/core/class/check_internet.dart';
import 'package:relic/core/class/status_request.dart';
import 'package:relic/core/service/link.dart';

import '../constant/const_data.dart';
import '../constant/shared_preferences_keys.dart';


class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String linkUrl, Map data, Map<String, String> header) async {
    try {

      if (await checkInternet()) {
        print("crud check internet");
        var response = await http.post(
          Uri.parse(linkUrl),
          body: jsonEncode(data),
          headers: header,
        );
        print(response);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(
    String linkUrl,
    Map data,
  ) async {
    try {
      print('try catch');
      if (await checkInternet()) {
        var response = await http.get(
          Uri.parse(linkUrl),
          headers: getHeader(),
        );
        print('dodoodododod');
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        print("data ${ConstData.token}");
        print("data ${SharedPreferencesKeys.tokenKey}");

        print("response.statusCode is ${response.statusCode}");
        print("response.body is $responseBody");

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);

          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serverFailure);
    }
  }
}
