import 'package:elfarqadan_app/app/views/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Al Farqadan',
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
