import 'package:chess_app/Game%20Page/game_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chess App"),
        actions: const [],
      ),
      body: const GameLayout(),
    );
  }
}
