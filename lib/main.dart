import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:relic/firebase_options.dart';
import 'app.dart';
import 'core/service/service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialServices();
  MyServices();
  runApp(MyApp());
}