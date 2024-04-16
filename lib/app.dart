import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relic/binding/initial_bindings.dart';
import 'package:relic/core/constant/shared_preferences_keys.dart';
import 'package:relic/core/service/service.dart';
import 'package:relic/screens/authentication/welcome/welcome.dart';
import 'package:relic/screens/home/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find<MyServices>();
    bool isLoggedIn =myServices.sharedPreferences
        .getBool(SharedPreferencesKeys.isLoginKey)?? false;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      home: isLoggedIn ? HomeScreen() : Welcome(),
    );
  }
}
