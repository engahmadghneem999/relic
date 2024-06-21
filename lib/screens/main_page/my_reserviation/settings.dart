import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('SETTINGS'),
        backgroundColor: Color(0xFF009B8D),
        centerTitle: true,
      ),
    );
  }
}
