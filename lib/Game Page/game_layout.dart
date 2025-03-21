import 'package:chess_app/Game%20Page/game_board.dart';
import 'package:chess_app/Game%20Page/game_status_box.dart';
import 'package:chess_app/utiles/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameLayout extends StatelessWidget {
  const GameLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<DataProvider>(
        builder: (context, value, child) {
          print("Makes Relods");
          return Column(
            children: [GameBoard(), GameStatusBox()],
          );
        },
      ),
    );
  }
}
