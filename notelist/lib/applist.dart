import 'package:flutter/material.dart';
import 'package:notelist/state.dart';
import 'package:provider/provider.dart';

class AppList extends StatefulWidget {
  const AppList({super.key});

  @override
  AppListState createState() => AppListState();
}

class AppListState extends State<AppList> {
  late GlobalState globalState;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalState globalState = Provider.of<GlobalState>(context);

    return Consumer<GlobalState>(
      builder: (context, globalState, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  debugPrint("Add!");
                }
              )
            ]
          ),
          body: ListView(
            padding: const EdgeInsets.all(12),
            children: const []
          )
        );
      }
    );
  }
}