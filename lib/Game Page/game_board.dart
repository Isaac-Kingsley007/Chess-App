import 'package:chess_app/Chess/chess.dart';
import 'package:chess_app/Game%20Page/chess_box.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final _chess = Chess();

  void makeMove() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        itemBuilder: (context, index) {
          int row = index ~/ 8;
          int col = index % 8;
          return ChessBox(
            row: row,
            col: col,
            chess: _chess,
            makeMove: makeMove,
          );
        },
        itemCount: 64,
      ),
    );
  }
}
