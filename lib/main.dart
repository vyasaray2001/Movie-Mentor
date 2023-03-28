import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Pages/HomePage/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie Recommender",
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
      home: MyHome(),
    );
  }
}
