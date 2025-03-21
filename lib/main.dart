import 'package:chess_app/home_page.dart';
import 'package:chess_app/utiles/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProvider()),
      ],
      child: const ChessApp(),
    ),
  );
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
