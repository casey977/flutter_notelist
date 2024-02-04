import 'package:flutter/material.dart';
import 'state.dart';

class TileClass {
  final String title;
  final int number;
  
  TileClass({required this.title, required this.number});
}

class ListTileWidget extends StatelessWidget {
  final String title;

  const ListTileWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    GlobalState globalState = Provider.of<GlobalState>(context);

    return ListTile(
      leading: const Icon(Icons.edit_note_sharp),
      title: Text(title),
      tileColor: const Color.fromARGB(255, 37, 37, 37),
      onTap: () {
        globalState.wakePad();
      }
    );
  }
}