import 'package:chess_app/Chess/chess.dart';
import 'package:chess_app/Chess/piece.dart';
import 'package:chess_app/utiles/functions.dart';
import 'package:chess_app/utiles/game_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChessBox extends StatefulWidget {
  final int row, col;
  final Chess chess;
  late final Function makeMove;
  late final bool isWhite = (row + col) % 2 == 0;
  late final Piece? piece = chess.board[row][col];

  ChessBox(
      {super.key,
      required this.row,
      required this.col,
      required this.chess,
      required this.makeMove});

  @override
  State<ChessBox> createState() => _ChessBoxState();
}

class _ChessBoxState extends State<ChessBox> {
  Draggable getDraggablePiece(Piece? piece, int row, int col) {
    return Draggable(
        feedback: getAsset(piece!), data: (row, col), child: getAsset(piece));
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<(int, int)>(
      builder: (context, candidateData, rejectedData) {
        return Container(
            color: (widget.isWhite) ? GameColors.light : GameColors.dark,
            child: (widget.piece != null)
                ? getDraggablePiece(widget.piece, widget.row, widget.col)
                : const SizedBox());
      },
      onWillAcceptWithDetails: (details) => true,
      onAcceptWithDetails: (details) {
        var (frow, fcol) = details.data;

        widget.chess.board[widget.row][widget.col] =
            widget.chess.board[frow][fcol];
        widget.chess.board[frow][fcol] = null;

        widget.makeMove();
      },
    );
  }
}
