// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'applist.dart';
import 'package:provider/provider.dart';
import 'state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GlobalState(),
      child: MainApp()
    )
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  late GlobalState globalState;

  @override
  void initState() {
    super.initState();
    globalState = Provider.of<GlobalState>(context, listen: false);

    globalState.getNotes();
    globalState.setupList(AppList());
  }

  @override
  Widget build(BuildContext context) {
    GlobalState globalState = Provider.of<GlobalState>(context);

    return Consumer<GlobalState>(
      builder: (context, leGlobalState, child) {
        return MaterialApp(
          theme: ThemeData(
              colorScheme: const ColorScheme(
                brightness: Brightness.dark,
                primary: Color.fromARGB(255, 0, 0, 0),
                onPrimary: Color.fromARGB(255, 0, 0, 0),
                secondary: Color.fromARGB(255, 255, 255, 255),
                onSecondary: Color.fromARGB(255, 255, 255, 255),
                error: Color.fromARGB(0, 255, 0, 0),
                onError: Color.fromARGB(0, 255, 0, 0),
                background: Color.fromARGB(255, 0, 0, 0),
                onBackground: Color.fromARGB(255, 0, 0, 0),
                surface: Color.fromARGB(255, 0, 0, 0),
                onSurface: Color.fromARGB(255, 255, 255, 255),
              )
            ),
          home: Stack(
            children: globalState.stackWidgets
          )
        );
      }
    );
  }
}