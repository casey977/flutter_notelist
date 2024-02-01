import 'package:flutter/material.dart';

class TileClass {
  String title;

  TileClass({required this.title});
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.edit_note_sharp),
      title: Text("Test!"),
      tileColor:  Color.fromARGB(255, 37, 37, 37),
    );
  }
}