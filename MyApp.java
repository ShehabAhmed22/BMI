import 'package:flutter/material.dart';
import 'home.dart';
import 'resulte.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        primarySwatch: Colors.teal,
        canvasColor: Colors.black,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
              fontSize: 45, fontWeight: FontWeight.w900, color: Colors.white),
          headline1: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
