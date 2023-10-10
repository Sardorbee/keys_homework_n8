import 'package:flutter/material.dart';
import 'package:keys_homework_n8/key.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MyListDragAndDrop(),
    );
  }
}
