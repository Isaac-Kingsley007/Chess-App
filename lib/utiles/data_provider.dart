import 'package:chess/chess.dart' as chess_api;
import 'package:chess_app/Chess-AI/chess_ai.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  final chess_api.Chess game = chess_api.Chess();

  //DataProvider({});

  void makeMove(String from, String to) {
    final moveDict = {'from': from, 'to': to};
    bool isValid = game.move(moveDict);
    if (isValid) {
      notifyListeners();
      aiPlay();
      notifyListeners();
    }
  }

  void makeMovePromotion(String from, String to, String promotion) {
    final moveDict = {'from': from, 'to': to, 'promotion': promotion};
    bool isValid = game.move(moveDict);
    if (isValid) {
      notifyListeners();
      aiPlay();
      notifyListeners();
    }
  }

  void aiPlay() => game.move(generateMove(game, 2));

  chess_api.Color getTurn() => game.turn;

  Color getTurnColor() =>
      (game.turn == chess_api.Color.WHITE) ? Colors.white : Colors.black;

  String gameStatement() {
    if (game.game_over) {
      if (game.in_checkmate) {
        return "Checkmate ${game.turn} won";
      } else {
        return 'draw';
      }
    }
    if (game.in_check) {
      return "check";
    }
    return '';
  }
}
