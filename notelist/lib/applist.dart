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

    debugPrint(globalState.stackWidgets.length.toString());

    // Build list of notes here...
    List<Widget> theList = [];
    
    return Consumer<GlobalState>(
      builder: (context, leGlobalState, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  debugPrint("Add!");
                  globalState.wakePad(number: 0);
                }
              )
            ]
          ),
          body: ListView(
            padding: const EdgeInsets.all(12),
            scrollDirection: Axis.vertical,
            children: theList // globalState.stackWidgets
          )
        );
      }
    );
  }
}