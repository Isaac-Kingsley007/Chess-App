import 'package:chess/chess.dart' as chess_api;
import 'package:chess_app/Chess/piece.dart';
import 'package:chess_app/utiles/functions.dart';
import 'package:chess_app/utiles/game_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChessBox extends StatefulWidget {
  final int row, col;
  final chess_api.Chess chessAPI;
  late final Function makeMove;
  late final bool isWhite = (row + col) % 2 == 0;
  late final Piece? piece;

  ChessBox({
    super.key,
    required this.row,
    required this.col,
    required this.chessAPI,
    required this.makeMove,
    required this.piece,
  });

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
      onWillAcceptWithDetails: (details) {
        // var (frow, fcol) = details.data;
        // int fr = (8 - frow);
        // String fc = String.fromCharCode('a'.codeUnitAt(0) + fcol);
        // int tr = (8 - widget.row);
        // String tc = String.fromCharCode('a'.codeUnitAt(0) + widget.col);
        // final enc = {'from': '$fc$fr', 'to': '$tc$tr'};
        // bool ret = widget.chessAPI.move(enc);
        // print("$enc $ret");
        // print("Board state:\n${widget.chessAPI.ascii}");
        // return ret;
        return true;
      },
      onAcceptWithDetails: (details) {
        var (frow, fcol) = details.data;

        int fr = (8 - frow);
        String fc = String.fromCharCode('a'.codeUnitAt(0) + fcol);
        int tr = (8 - widget.row);
        String tc = String.fromCharCode('a'.codeUnitAt(0) + widget.col);
        final enc = {'from': '$fc$fr', 'to': '$tc$tr'};
        bool ret = widget.chessAPI.move(enc);
        if (ret) {
          widget.makeMove(frow, fcol, widget.row, widget.col);
        }
      },
    );
  }
}
