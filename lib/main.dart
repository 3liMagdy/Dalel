

import 'package:dalel/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Dalel());
}

class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dalel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Column(
          children: [
            Image.asset(AppAssets.succcesOrder),
            const Center(
              child: Text('Hello, Dalel!'),
            ),
          ],
        ),
      ),
    );
  }
}