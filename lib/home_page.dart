import 'package:chess_app/Game%20Page/game_board.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chess App"),
        actions: [],
      ),
      body: GameBoard(),
    );
  }
}
