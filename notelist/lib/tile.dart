import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';

class Tile {
  final String title;
  final int number;
  
  Tile({required this.title, required this.number});
}

class ListTile extends StatefulWidget {
  final String title;
  final int number;

  const ListTile({super.key, required this.title, required this.number});

  @override
  TileState createState() => TileState();
}

class TileState extends State<ListTile> {

  @override
  Widget build(BuildContext context) {
    GlobalState globalState = Provider.of<GlobalState>(context);

    return GestureDetector(
      child: const Card(
        color: Colors.black
      ),
      onTap: () {
        globalState.wakePad(number: widget.number);
      },
    );
  }
}