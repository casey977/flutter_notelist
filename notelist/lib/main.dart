import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                1+1;
              },
            )
          ]
        ),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.edit_note_sharp),
              title: const Text("Test!"),
              onTap: () {
                1+1;
              }
            )
          ]
        )
      )
    );
  }
}