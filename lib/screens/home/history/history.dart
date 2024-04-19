import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('HISTORY'),
        backgroundColor: Color(0xFF009B8D),
        centerTitle: true,
      ),
    );
  }
}
