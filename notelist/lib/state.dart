import 'package:flutter/material.dart';
import 'package:notelist/note.dart';
import 'package:notelist/storage_handling.dart';
import 'dart:convert';
import 'dart:io';
import 'applist.dart';
import 'pad.dart';

var storage = HandleStorage();

class GlobalState extends ChangeNotifier {
  List<Widget> stackWidgets = [];
  List<String> notesRaw = [];
  List<Note> notes = [];

  void getNotes() async {
    List<String> filepaths = await storage.localFilePaths();

    // Get all the notes, raw...
    String text;
    File tmp;
    for (String element in filepaths) {
      tmp = await storage.localFile(element);
      text = await tmp.readAsString();
      notesRaw.add(text);
    }

    // Convert raw notes to classes...
    for (String element in filepaths) {
      Map<String, dynamic> jsonMap = jsonDecode(element);
      notes.add(Note.fromJson(jsonMap));
    }

    notifyListeners();
  }

  void setupList(widg) {
    stackWidgets.add(AppList());
    notifyListeners();
  }

  void wakePad({required int number}) {
    stackWidgets.add(Pad(number));
    notifyListeners();
  }

  /*
  void saveNotes() {
    1+1;
  }
  */
}