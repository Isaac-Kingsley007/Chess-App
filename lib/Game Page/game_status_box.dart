import 'package:chess_app/utiles/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameStatusBox extends StatelessWidget {
  const GameStatusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: context.watch<DataProvider>().getTurnColor(),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1)),
            child: const Text("Turn"),
          ),
          Text(context.watch<DataProvider>().gameStatement())
        ],
      ),
    );
  }
}
