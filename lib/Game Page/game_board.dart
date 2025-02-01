import 'package:chess_app/Chess-AI/chess_AI.dart';
import 'package:chess_app/Game%20Page/chess_box.dart';
import 'package:flutter/material.dart';
import 'package:chess/chess.dart' as chess_api;

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final _api = chess_api.Chess();

  Future<String> genBestMoveAsync(chess_api.Chess game, int depth) async {
    return await Future(() {
      return generateMove(_api, depth);
    });
  }

  void makeMove() {
    setState(() {});
    print("state setted");
    Future.delayed(Duration.zero, () async {
      var move = await genBestMoveAsync(_api, 2);
      setState(() {
        _api.move(move);
      });
      print("state setted");
    });
    print("call ended");
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        itemBuilder: (context, index) {
          int row = index ~/ 8;
          int col = index % 8;
          return ChessBox(
            row: row,
            col: col,
            chessAPI: _api,
            makeMove: makeMove,
          );
        },
        itemCount: 64,
      ),
    );
  }
}
