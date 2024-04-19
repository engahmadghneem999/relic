import 'package:flutter/material.dart';

class Tourist extends StatelessWidget {
  const Tourist({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('TOURIST'),
        backgroundColor: Color(0xFF009B8D),
        centerTitle: true,
      ),
    );
  }
}
