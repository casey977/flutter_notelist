import 'package:flutter/material.dart';
import 'dart:io';
import 'applist.dart';
import 'pad.dart';

import 'package:path_provider/path_provider.dart';

List<Widget> stackWidgets = [];

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    stackWidgets.add(AppList(callback: addPad));
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

  addPad() {
    setState(() {
      stackWidgets.add(const Pad());
    });
  }

  void saveToFile(String text) async {
    try {
      final Directory directory = await getExternalStorageDirectory();
      final File file = File('${directory.path}/myfile.txt');
      await file.writeAsString(text);
      debugPrint('Text saved to file successfully!');
    } catch (e) {
      debugPrint('Error saving to file: $e');
    }
  }
}