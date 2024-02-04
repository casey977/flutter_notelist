import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalState extends ChangeNotifier {
  List<Widget> stackWidgets = [];
  List<String> noteTitles = [];
  List<String> noteContents = [];
}