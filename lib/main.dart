import 'package:chess_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChessApp());
}

class ChessApp extends StatelessWidget {
  const ChessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chess App",
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}
