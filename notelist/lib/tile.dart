import 'package:flutter/material.dart';

class TileClass {
  final String title;
  final int number;
  
  TileClass({required this.title, required this.number});
}

class ListTileWidget extends StatelessWidget {
  final String tileTitle;

  const ListTileWidget({super.key, required this.tileTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.edit_note_sharp),
      title: Text(tileTitle),
      tileColor: const Color.fromARGB(255, 37, 37, 37),
    );
  }
}