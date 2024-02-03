import 'package:flutter/material.dart';

class AppList extends StatefulWidget {
  final VoidCallback callback;

  const AppList({super.key, required this.callback});

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
              widget.callback();
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