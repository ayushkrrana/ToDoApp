import 'package:flutter/material.dart';
import 'package:todo/todofile.dart';

void main() {
  runApp(
     const ToDoApp()
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ToDoAppMaterial());//home is the default root of the app which is displayed first when the app starts
  }
}
