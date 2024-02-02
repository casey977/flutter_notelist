import 'package:flutter/material.dart';
import 'tile.dart';

class AppList extends StatefulWidget {
  final Function onAddToStack;

  const AppList({super.key, required this.onAddToStack});

  @override
  AppListState createState() => AppListState();
}

class AppListState extends State<AppList> {
  @override
  void initState() {
    super.initState();
    // Load data here...
  }

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Widget widgetToAdd = Container(
                color: Colors.blue,
              );
              widget.onAddToStack(widgetToAdd);
            }
          )
        ]
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: list
      )
    );
  }
}