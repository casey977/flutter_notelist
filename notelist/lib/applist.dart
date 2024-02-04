import 'package:flutter/material.dart';

class AppList extends StatefulWidget {
  const AppList({super.key});

  @override
  AppListState createState() => AppListState();
}

class AppListState extends State<AppList> {
  @override
  void initState() {
    super.initState();
    
    
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
              1+1;
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