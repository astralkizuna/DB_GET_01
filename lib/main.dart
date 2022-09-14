import 'package:flutter/material.dart';
import 'package:studiotestremote01/fitmongo01.dart';
import 'fitbitdash01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FitDBlink01(),
    );
  }
}
