import 'package:chess_app/utiles/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:chess/chess.dart' as chess_api;

Image getAsset(chess_api.Piece piece) {
  if (piece.color == chess_api.Color.WHITE) {
    switch (piece.type) {
      case chess_api.PieceType.PAWN:
        return Image.asset("assets/Chess_plt60.png");
      case chess_api.PieceType.KNIGHT:
        return Image.asset("assets/Chess_nlt60.png");
      case chess_api.PieceType.BISHOP:
        return Image.asset("assets/Chess_blt60.png");
      case chess_api.PieceType.ROOK:
        return Image.asset("assets/Chess_rlt60.png");
      case chess_api.PieceType.QUEEN:
        return Image.asset("assets/Chess_qlt60.png");
      case chess_api.PieceType.KING:
        return Image.asset("assets/Chess_klt60.png");
    }
  } else {
    switch (piece.type) {
      case chess_api.PieceType.PAWN:
        return Image.asset("assets/Chess_pdt60.png");
      case chess_api.PieceType.KNIGHT:
        return Image.asset("assets/Chess_ndt60.png");
      case chess_api.PieceType.BISHOP:
        return Image.asset("assets/Chess_bdt60.png");
      case chess_api.PieceType.ROOK:
        return Image.asset("assets/Chess_rdt60.png");
      case chess_api.PieceType.QUEEN:
        return Image.asset("assets/Chess_qdt60.png");
      case chess_api.PieceType.KING:
        return Image.asset("assets/Chess_kdt60.png");
    }
  }

  throw Exception("Not Valid Piece");
}

Draggable getDraggablePiece(chess_api.Piece? piece, String square) {
  return Draggable(
      feedback: getAsset(piece!), data: square, child: getAsset(piece));
}

void showPromotionDialog(BuildContext context, Function(String) onPieceSelected,
    chess_api.Color turn) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Promote your pawn'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading:
                  getPieceImage(chess_api.PieceType.QUEEN, turn), // Queen icon
              title: const Text('Queen'),
              onTap: () => onPieceSelected('q'),
            ),
            ListTile(
              leading:
                  getPieceImage(chess_api.PieceType.ROOK, turn), // Rook icon
              title: const Text('Rook'),
              onTap: () => onPieceSelected('r'),
            ),
            ListTile(
              leading: getPieceImage(
                  chess_api.PieceType.BISHOP, turn), // Bishop icon
              title: const Text('Bishop'),
              onTap: () => onPieceSelected('b'),
            ),
            ListTile(
              leading: getPieceImage(
                  chess_api.PieceType.KNIGHT, turn), // Knight icon
              title: const Text('Knight'),
              onTap: () => onPieceSelected('n'),
            ),
          ],
        ),
      );
    },
  );
}

Image getPieceImage(chess_api.PieceType type, chess_api.Color color) {
  return getAsset(chess_api.Piece(type, color));
}

// void handlePawnPromotion(
//     BuildContext context, chess_api.Color turn, String from, String to) {
//   showPromotionDialog(context, (selectedPiece) {
//     Navigator.of(context).pop(); // Close the dialog
//     context.read<DataProvider>().(selectedPiece); // Perform promotion
//   }, turn);
// }
