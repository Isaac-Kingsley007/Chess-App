import 'package:chess/chess.dart' as chess_api;
import 'package:chess_app/Chess-AI/chess_ai.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  final chess_api.Chess game = chess_api.Chess();

  //DataProvider({});

  void makeMove(String from, String to) {
    print("Getting colls");
    final moveDict = {'from': from, 'to': to};
    bool isValid = game.move(moveDict);
    if (isValid) {
      notifyListeners();
      print("Inside Make Move : $isValid");
      print(game.ascii);
      aiPlay();
      notifyListeners();
    } else {
      print("Not Valid");
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
