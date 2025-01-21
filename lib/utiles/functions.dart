import 'package:flutter/material.dart';
import 'package:chess/chess.dart' as chess_api;

Image getAsset(chess_api.Piece piece) {
  if (piece.color == chess_api.Chess.WHITE) {
    switch (piece.type) {
      case chess_api.PieceType.PAWN:
        return Image.asset("Chess_plt60.png");
      case chess_api.PieceType.KNIGHT:
        return Image.asset("Chess_nlt60.png");
      case chess_api.PieceType.BISHOP:
        return Image.asset("Chess_blt60.png");
      case chess_api.PieceType.ROOK:
        return Image.asset("Chess_rlt60.png");
      case chess_api.PieceType.QUEEN:
        return Image.asset("Chess_qlt60.png");
      case chess_api.PieceType.KING:
        return Image.asset("Chess_klt60.png");
    }
  } else {
    switch (piece.type) {
      case chess_api.PieceType.PAWN:
        return Image.asset("Chess_pdt60.png");
      case chess_api.PieceType.KNIGHT:
        return Image.asset("Chess_ndt60.png");
      case chess_api.PieceType.BISHOP:
        return Image.asset("Chess_bdt60.png");
      case chess_api.PieceType.ROOK:
        return Image.asset("Chess_rdt60.png");
      case chess_api.PieceType.QUEEN:
        return Image.asset("Chess_qdt60.png");
      case chess_api.PieceType.KING:
        return Image.asset("Chess_kdt60.png");
    }
  }
}
