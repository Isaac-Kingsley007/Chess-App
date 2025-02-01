import 'package:chess/chess.dart' as chess_api;
import 'package:chess_app/utiles/data_provider.dart';
import 'package:chess_app/utiles/functions.dart';
import 'package:chess_app/utiles/game_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ChessBox extends StatefulWidget {
  final int row, col;
  final chess_api.Chess chessAPI;
  late final Function makeMove;

  late final bool isWhite = (row + col) % 2 == 0;
  late final String colLetter = String.fromCharCode('a'.codeUnitAt(0) + col);
  late final int rowVal = 8 - row;
  late final String square = "$colLetter$rowVal";
  late final chess_api.Piece? piece = chessAPI.get(square);

  ChessBox({
    super.key,
    required this.row,
    required this.col,
    required this.chessAPI,
    required this.makeMove,
  });

  @override
  State<ChessBox> createState() => _ChessBoxState();
}

class _ChessBoxState extends State<ChessBox> {
  @override
  Widget build(BuildContext context) {
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
        // final enc = {'from': details.data, 'to': widget.square};
        // bool ret = widget.chessAPI.move(enc);

        // if (ret) {
        //   widget.makeMove();
        // }

        if (widget.row == 0 || widget.row == 7) {
          chess_api.Piece pieceComming = widget.chessAPI.get(details.data)!;
          if (pieceComming.type == chess_api.PieceType.PAWN) {
            showPromotionDialog(context, (selectedPiece) {
              Navigator.of(context).pop();
              context.read<DataProvider>().makeMovePromotion(
                  details.data, widget.square, selectedPiece);
            }, widget.chessAPI.turn);
          }
        } else {
          context.read<DataProvider>().makeMove(details.data, widget.square);
        }
      },
    );
  }
}
