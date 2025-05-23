import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
   // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent))-it will help us set the different styles at the top of the status bar - a status bar is a bar which include battery level , time and network signal and wifi bluetooth icons,etc
    return const MaterialApp(home: ToDoAppMaterial(),
    debugShowCheckedModeBanner: true,// it will hide the banner of the debug mode which appear at the top right corner
    );//home is the default root of the app which is displayed first when the app starts
  }
}
