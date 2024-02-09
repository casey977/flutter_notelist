// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'note.dart';
import 'state.dart';
import 'package:provider/provider.dart';

class NewPad extends StatefulWidget {
  const NewPad({super.key});

  @override
  PadState createState() => PadState();
}

class PadState extends State<NewPad> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("New note..."),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () { // Save note...
              Note tmpNote = Note(
                moment: DateTime.now(),
                title: _controller1.text,
                content: _controller2.text
              );
              Map<String, dynamic> data = {
                'moment': tmpNote.moment.toString(),
                'title': tmpNote.title,
                'content': tmpNote.content
              };
              globalState.updateNoteList(tmpNote);
              String jsonString = json.encode(data);
              globalState.saveNote(jsonString, data['moment']);
              debugPrint('Notes: ${globalState.notes.length.toString()}');
              globalState.popScreen();
            }
          ),
          IconButton(
            icon: const Icon(Icons.subdirectory_arrow_right_rounded),
            onPressed: () { // Cancel note...
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