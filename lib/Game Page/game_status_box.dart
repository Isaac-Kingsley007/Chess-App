import 'package:chess_app/utiles/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameStatusBox extends StatelessWidget {
  const GameStatusBox({super.key});

  @override
  Widget build(BuildContext context) {
    print('Game status box built');
    return Row(
      children: [
        Container(
          color: context.read<DataProvider>().getTurnColor(),
          child: const Text("Turn"),
        ),
        Text(context.read<DataProvider>().gameStatement())
      ],
    );
  }
}
