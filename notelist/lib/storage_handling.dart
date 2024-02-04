import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class HandleStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/notelist_notes.txt');
  }

  Future<String> readNotes() async {
    try {
      final file = await _localFile;
      final content = await file.readAsString();
      return content;
    } catch (e) {
      return "ERROR";
    }
  }

  Future<File> writeNotes(content) async {
    final file = await _localFile;
    return file.writeAsString(content);
  }
}