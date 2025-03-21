import 'package:chess/chess.dart' as chess_api;
import 'package:chess_app/utiles/data_provider.dart';
import 'package:chess_app/utiles/functions.dart';
import 'package:chess_app/utiles/game_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChessBox extends StatefulWidget {
  final int row, col;

  late final bool isWhite = (row + col) % 2 == 0;
  late final String colLetter = String.fromCharCode('a'.codeUnitAt(0) + col);
  late final int rowVal = 8 - row;
  late final String square = "$colLetter$rowVal";
  chess_api.Piece? piece;

  ChessBox({
    super.key,
    required this.row,
    required this.col,
  });

  @override
  State<ChessBox> createState() => _ChessBoxState();
}

class _ChessBoxState extends State<ChessBox> {
  @override
  Widget build(BuildContext context) {
    widget.piece = context.watch<DataProvider>().game.get(widget.square);
    return DragTarget<String>(
      builder: (context, candidateData, rejectedData) {
        return Container(
            color: (widget.isWhite) ? GameColors.light : GameColors.dark,
            child: (widget.piece != null)
                ? getDraggablePiece(widget.piece, widget.square)
                : const SizedBox());
      },
      onWillAcceptWithDetails: (details) {
        return true;
      },
      onAcceptWithDetails: (details) {
        chess_api.Piece? pieceComming =
            context.read<DataProvider>().game.get(details.data);

        if (pieceComming == null) return;

        if ((widget.row == 0 || widget.row == 7) &&
            pieceComming.type == chess_api.PieceType.PAWN) {
          showPromotionDialog(context, (selectedPiece) {
            Navigator.of(context).pop();
            context
                .read<DataProvider>()
                .makeMovePromotion(details.data, widget.square, selectedPiece);
          }, context.read<DataProvider>().game.turn);
        } else {
          context.read<DataProvider>().makeMove(details.data, widget.square);
        }
      },
    );
  }
}
