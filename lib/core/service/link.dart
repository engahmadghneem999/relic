

import 'package:relic/core/constant/const_data.dart';

class AppLink {
  static String appRoot = "https://";
 // /api/app/survey/index
  static String imageWithRootUrl = ('$appRoot/storage/');
  static String imageWithoutRootUrl = (appRoot);
  static String serverApiRoot = "$appRoot/api";
}

Map<String, String> getHeader() {
  Map<String, String> mainHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
  };
  return mainHeader;
}

Map<String, String> getHeaderToken() {
  Map<String, String> mainHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'X-Requested-With': 'XMLHttpRequest',
    'Authorization': 'Bearer ${ConstData.token}',
  };
  return mainHeader;
}