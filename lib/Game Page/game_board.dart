import 'package:chess_app/Chess/chess.dart';
import 'package:chess_app/Chess/piece.dart';
import 'package:chess_app/Game%20Page/chess_box.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final _chess = Chess();
  final List<List<ChessBox?>> _chessBoxMatrix =
      List.filled(8, List.filled(8, null));

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
          bool isWhite = (row) & 1 == (col) & 1;
          Piece? piece = _chess.board[row][col];
          _chessBoxMatrix[row][col] = ChessBox(
            isWhite: isWhite,
            piece: piece,
            row: row,
            col: col,
            chessBoxMatrix: _chessBoxMatrix,
          );
          return _chessBoxMatrix[row][col];
        },
        itemCount: 64,
      ),
    );
  }
}
