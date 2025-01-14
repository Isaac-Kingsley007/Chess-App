import 'package:chess_app/Chess/piece.dart';
import 'package:chess_app/utiles/functions.dart';
import 'package:chess_app/utiles/game_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChessBox extends StatefulWidget {
  final bool isWhite;
  Piece? piece;
  final int row, col;
  final List<List<ChessBox?>> chessBoxMatrix;
  late final ss;

  ChessBox({
    super.key,
    required this.isWhite,
    this.piece,
    required this.row,
    required this.col,
    required this.chessBoxMatrix,
  });

  @override
  State<ChessBox> createState() => _ChessBoxState();
}

class _ChessBoxState extends State<ChessBox> {
  void ssd() {
    setState(() {});
  }

  @override
  void initState() {
    widget.ss = ssd;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<(int, int)>(
      builder: (context, candidateData, rejectedData) {
        return Container(
          color: (widget.isWhite) ? GameColors.light : GameColors.dark,
          child: DraggablePiece(
              col: widget.col, row: widget.row, piece: widget.piece),
        );
      },
      onWillAcceptWithDetails: (detils) => true,
      onAcceptWithDetails: (details) {
        var data = details.data;
        int fromRow = data.$1;
        int fromCol = data.$2;

        widget.piece = widget.chessBoxMatrix[fromRow][fromCol]!.piece;
        widget.chessBoxMatrix[fromRow][fromCol]!.piece = null;
        widget.chessBoxMatrix[fromRow][fromCol]!.ss();
        print("$fromRow $fromCol $widget.piece.piece_type ");
        setState(() {});
      },
    );
  }
}

class DraggablePiece extends StatelessWidget {
  final Piece? piece;
  final int row, col;
  const DraggablePiece(
      {super.key, required this.row, required this.col, this.piece});

  @override
  Widget build(BuildContext context) {
    return (piece != null)
        ? Draggable(
            feedback: getAsset(piece!),
            data: (row, col),
            child: getAsset(piece!))
        : const SizedBox();
  }
}
