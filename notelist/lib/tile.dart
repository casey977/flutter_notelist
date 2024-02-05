import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class Tile extends StatefulWidget {
  final String title;
  final int number;

  const Tile({super.key, required this.title, required this.number});

  @override
  TileState createState() => TileState();
}

class TileState extends State<Tile> {

  @override
  Widget build(BuildContext context) {
    GlobalState globalState = Provider.of<GlobalState>(context);

    return GestureDetector(
      onTap: () {
        globalState.wakePad(number: widget.number);
      },
      child: const Card(
        color: Colors.black
      )
    );
  }
}