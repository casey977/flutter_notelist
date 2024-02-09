import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HandleStorage {
  late String _dir;

  Future<String> ensureFolder() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/notelist/';
    if (!(await Directory(path).exists())) {
    } else {
      await Directory(path).create(recursive: true); // Use path here
    }
    _dir = '${directory.path}/notelist/';
    return '${directory.path}/notelist/';
  }
  
  String getDir() {
    return _dir;
  }

  Future<String> _localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> localFile(String filename) async {
    final path = await _localPath();
    return File('${filename}');
  }

  Future<List<String>> localFilePaths() async {
    try {
      String path = await _localPath();
      Directory directory = Directory('$path/notelist/');
      List<FileSystemEntity> files = directory.listSync();
      List<String> fileList = [];
      for (var file in files) {
        debugPrint(file.toString());
        fileList.add(file.path);
      }
      return fileList;
    } catch (e) {
      throw Exception('Error getting files!');
    }
  }

  void deleteFile(String filePath) async {
    try {
      File file = File(filePath);
      if (await file.exists()) {
        await file.delete();
      } else {
        debugPrint('Filenot found!');
      }
    } catch (e) {
      debugPrint('ERROR: $e');
    }
  }
}