import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class HandleStorage {
  Future<String> _localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> localFile(String filename) async {
    final path = _localPath;
    return File('$path/$filename');
  }

  Future<List<String>> localFilePaths() async {
    try {
      String path = await _localPath();
      Directory directory = Directory(path);
      List<FileSystemEntity> files = directory.listSync();
      List<String> fileList = [];
      for (var file in files) {
        fileList.add(file.path);
      }
      return fileList;
    } catch (e) {
      throw Exception('Error getting files!');
    }
  }

  /*
  Future<File> writeNotes(content) async {
    final file = await _localFile;
    return file.writeAsString(content);
  }
  */
}