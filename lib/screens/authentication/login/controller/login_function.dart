import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/const_data.dart';
import '../../../../core/constant/shared_preferences_keys.dart';
import '../../../../core/service/service.dart';
import '../../../../widgets/bottom_nav_bar.dart';

signInWithEmailAndPassword(
    String emailAddress, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);

    await Get.find<MyServices>()
        .sharedPreferences
        .setBool(SharedPreferencesKeys.isLoginKey, true);
    ConstData.isLogin == true;

    Get.offAll( const BottomNavBar());
    print(credential);
  } on FirebaseAuthException catch (e) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Login Failed'),
              content: Text( e.code.toString()
                  == 'invalid-email' ?  'The email address is badly formatted.':
                  e.code.toString()
                  == 'user-not-found'
                  ? 'No user found for that email.'
                  : e.code == 'wrong-password'
                  ? 'Wrong password provided for that user.'
                  : 'Email OR Password is wrong please try again'),
            ));
  }
}

