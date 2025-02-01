import 'dart:math';

import 'package:chess/chess.dart';

final pieceValues = <PieceType, int>{
  PieceType.PAWN: 1,
  PieceType.KNIGHT: 3,
  PieceType.BISHOP: 3,
  PieceType.ROOK: 4,
  PieceType.QUEEN: 9,
  PieceType.KING: 100,
};

int staticEvaluation(Chess game) {
  if (game.game_over) {
    if (game.in_checkmate) {
      if (game.king_attacked(game.turn)) {
        return -1000;
      } else {
        return 1000;
      }
    } else {
      return 0;
    }
  }

  int score = 0, val;

  for (var square in game.board) {
    if (square != null) {
      val = pieceValues[square.type] ?? 0;
      score += (game.turn == square.color) ? val : -val;
    }
  }

  if (game.in_check) score -= 5;

  return score;
}

int negamax(Chess game, int depth, int alpha, int beta) {
  if (game.game_over || depth == 0) {
    return staticEvaluation(game);
  }

  int bestScore = -1000, score;

  for (var move in game.moves()) {
    game.move(move);
    score = -negamax(game, depth - 1, -beta, -alpha);
    game.undo();

    bestScore = max(bestScore, score);
    alpha = max(alpha, score);

    if (alpha >= beta) break;
  }

  return bestScore;
}

String bestMove(Chess game, int depth) {
  int bestScore = -100000, score;
  String bestMove = "";
  for (var move in game.moves()) {
    //print(move);
    game.move(move);
    score = -negamax(game, depth - 1, -100000, 100000);
    game.undo();

    if (score > bestScore) {
      bestMove = move;
      bestScore = score;
    }
  }

  return bestMove;
}

String generateMove(Chess game, int depth) {
  if (game.move_number < 2) {
    var moves = game.moves();
    return moves[Random().nextInt(moves.length)];
  } else {
    return bestMove(game, depth);
  }
}

//int findHash(int val, Chess game, String move) {}
