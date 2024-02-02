import 'package:flutter/material.dart';
import 'applist.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  List<Widget> stackWidgets = [];

  void addToStack(Widget widgetToAdd) {
    setState(() {
      stackWidgets.add(widgetToAdd);
    });
  }

  @override
  void initState() {
    super.initState();
    Widget initialWidget = AppList(onAddToStack: addToStack);
    stackWidgets.add(initialWidget);
  }

  @override
  Widget build(BuildContext context) {

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
        children: stackWidgets
      )
    );
  }
}

// Functions...

void openPad() {
  1+1;
}