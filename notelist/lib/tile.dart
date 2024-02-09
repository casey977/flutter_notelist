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
          debugPrint('test: ${widget.number.toString()}');
          globalState.wakePad(number: widget.number);
        },
        child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 57, 63),
              border: Border.all(
                width: 5,
                color: Colors.black,
              ),
            ),
            child: Center(child: Text(widget.title))));
  }
}
