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
  int activeNote = 0;
  
  void ensureFolder() async {
    storage.ensureFolder();
  }

  void getNotes() async {
    List<String> filepaths = await storage.localFilePaths();

    // Get all the notes, raw...
    String text;
    File tmp;
    for (String element in filepaths) {
      tmp = await storage.localFile(element);
      debugPrint("LE PATH: $element");
      try {
      text = await tmp.readAsString();
      notesRaw.add(text);
      } catch (error) {
        debugPrint('ERROR: Error reading file: $error');
      }
    }

    // Convert raw notes to classes...
    for (String element in notesRaw) {
      Map<String, dynamic> jsonMap = jsonDecode(element);
      notes.add(Note.fromJson(jsonMap));
    }

    notifyListeners();
  }

  void setupList(AppList widg) {
    stackWidgets.add(const AppList());
    notifyListeners();
  }

  void wakePad({required int number}) {
    stackWidgets.add(Pad(number: number));
    notifyListeners();
  }

  /*
  void saveNotes() {
    1+1;
  }
  */
}