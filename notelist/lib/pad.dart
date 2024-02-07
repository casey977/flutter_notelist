// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
    if (widget.number == 0) {
      _controller1.text = "";
      _controller2.text = "";
    } else {
      _controller1.text = globalState.notes[globalState.activeNote].title;
      _controller2.text = globalState.notes[globalState.activeNote].content;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("New note..."),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              1+1;
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

/*

Scaffold(
      appBar: AppBar(
        title: const Text("New note..."),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              1+1;
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
              labelText: "Title...",
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

*/