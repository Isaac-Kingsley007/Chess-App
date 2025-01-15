import 'package:chess_app/Chess/chess.dart';
import 'package:chess_app/Game%20Page/chess_box.dart';
import 'package:flutter/material.dart';
import 'package:chess/chess.dart' as chess_api;
import 'package:chess_app/Chess/piece.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final _chess = Chess();
  final _api = chess_api.Chess();

  void makeMove(int frow, int fcol, int trow, int tcol) {
    setState(() {
      Piece? movedPiece = _chess.board[frow][fcol];
      _chess.board[frow][fcol] = null;
      _chess.board[trow][tcol] = movedPiece;
    });
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
            chessAPI: _api,
            piece: _chess.board[row][col],
            makeMove: makeMove,
          );
        },
        itemCount: 64,
      ),
    );
  }
}
