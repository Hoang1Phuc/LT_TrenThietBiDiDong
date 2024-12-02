import 'package:flutter/material.dart';
import 'package:flutter_041/baitap1.dart';
import 'package:flutter_041/baitap2.dart';
import 'package:flutter_041/vd.dart';
import 'package:flutter_041/baitap3.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

