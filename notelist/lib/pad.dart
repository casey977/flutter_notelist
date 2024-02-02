import 'package:flutter/material.dart';

class Pad extends StatefulWidget {
  const Pad({super.key});

  @override
  PadState createState() => PadState();
}

class PadState extends State<Pad> {
  @override
  Widget build(BuildContext context) {
    return Container(color: const Color.fromARGB(255, 0, 0, 255));
  }
}