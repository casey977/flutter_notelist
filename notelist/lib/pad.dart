// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'note.dart';
import 'state.dart';
import 'package:provider/provider.dart';

class Pad extends StatefulWidget {
  final int number;

  const Pad({super.key, required this.number});

  @override
  PadState createState() => PadState();
}

class PadState extends State<Pad> {
  late GlobalState globalState;
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    globalState = Provider.of<GlobalState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _controller1.text = globalState.notes[widget.number].title;
    _controller2.text = globalState.notes[widget.number].content;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Note..."),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () { // Save note...
              Note tmpNote = globalState.notes[widget.number];
              Map<String, dynamic> data = {
                'moment': tmpNote.moment.toString(),
                'title': tmpNote.title,
                'content': _controller2.text
              };
              String jsonString = json.encode(data);
              globalState.saveNote(jsonString, data['moment']);
              globalState.notes[widget.number].content = _controller2.text;
              globalState.popScreen();
            }
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              String name = globalState.notes[widget.number].moment.toString();
              storage.deleteFile('${storage.getDir()}$name');
              globalState.notes.removeAt(widget.number);
              globalState.popScreen();
            }
          ),
          IconButton(
            icon: const Icon(Icons.subdirectory_arrow_right_rounded),
            onPressed: () {
              globalState.popScreen();
            }
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
            controller: _controller1,
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: "Title...",
              filled: true,
              fillColor: Colors.blueGrey,
              border: InputBorder.none
            )
            ),
            Container(
              height: 10
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "Note...",
                filled: true,
                fillColor: Colors.blueGrey,
                border: InputBorder.none
              )
            )
          ]
        )
      )
    );
  }
}