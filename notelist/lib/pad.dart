// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import "main.dart";
import 'state.dart';
import 'package:provider/provider.dart';

class Pad extends StatefulWidget {
  int number;

  Pad({super.key, required this.number});

  @override
  PadState createState() => PadState();
}

class PadState extends State<Pad> {
  late GlobalState globalState;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    globalState = Provider.of<GlobalState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = globalState.active_note;

    return Scaffold(
      appBar: AppBar(
        title: const Text("New note..."),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
            }
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              1+1;
            }
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
            controller: _controller,
            keyboardType: TextInputType.multiline,
            maxLines: 1,
            decoration: InputDecoration(
              labelText: "Enter title...",
              filled: true,
              fillColor: Colors.blueGrey,
              border: InputBorder.none
            )
            ),
            Container(
              height: 10
            ),
            const TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                labelText: "Enter note...",
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