import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HandleStorage {
  Future<void> ensureFolder() async {
  final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/notelist/'; // Use / instead of .
    if (await Directory(path).exists()) {
      debugPrint('Folder already exists!');
    } else {
      await Directory(path).create(recursive: true); // Use path here
      debugPrint('Folder created');
    }
  }

  Future<String> _localPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> localFile(String filename) async {
    final path = await _localPath();
    return File('${path}/${filename}');
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
}