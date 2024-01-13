import 'package:elite_ecommerce/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elite Ecommerce',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}