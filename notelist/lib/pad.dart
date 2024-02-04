import 'package:flutter/material.dart';
import "main.dart";

class Pad extends StatefulWidget {
  const Pad({super.key});

  @override
  PadState createState() => PadState();
}

class PadState extends State<Pad> {
  
  @override
  Widget build(BuildContext context) {
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
            const TextField(
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