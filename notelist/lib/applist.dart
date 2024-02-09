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
          body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: globalState.notes.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  border: Border.all(
                    width: 5,
                    color: Colors.black,
                  ),
                ),
                child: Center(child: Text(globalState.notes[index].title.toString())),
              );
            }
          )
        );
      }
    );
  }
}