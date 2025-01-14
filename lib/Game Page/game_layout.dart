import 'package:chess_app/Game%20Page/game_board.dart';
import 'package:flutter/material.dart';

class GameLayout extends StatelessWidget {
  const GameLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: GameBoard(),
    );
  }
}
