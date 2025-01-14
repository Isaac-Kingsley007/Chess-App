import 'package:chess_app/Chess/piece.dart';
import 'package:chess_app/Chess/piece_type.dart';
import 'package:flutter/material.dart';

Image getAsset(Piece piece) {
  if (piece.isWhite) {
    switch (piece.pieceType) {
      case PieceType.pawn:
        return Image.asset("Chess_plt60.png");
      case PieceType.knight:
        return Image.asset("Chess_nlt60.png");
      case PieceType.bishop:
        return Image.asset("Chess_blt60.png");
      case PieceType.rook:
        return Image.asset("Chess_rlt60.png");
      case PieceType.queen:
        return Image.asset("Chess_qlt60.png");
      case PieceType.king:
        return Image.asset("Chess_klt60.png");
    }
  } else {
    switch (piece.pieceType) {
      case PieceType.pawn:
        return Image.asset("Chess_pdt60.png");
      case PieceType.knight:
        return Image.asset("Chess_ndt60.png");
      case PieceType.bishop:
        return Image.asset("Chess_bdt60.png");
      case PieceType.rook:
        return Image.asset("Chess_rdt60.png");
      case PieceType.queen:
        return Image.asset("Chess_qdt60.png");
      case PieceType.king:
        return Image.asset("Chess_kdt60.png");
    }
  }
}
