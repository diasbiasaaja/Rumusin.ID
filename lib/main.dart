import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(MathMateApp());
}

class MathMateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RUMUSIN.id',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: SplashScreen(),
    );
  }
}
