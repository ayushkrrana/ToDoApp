import 'package:flutter/cupertino.dart';

class ToDo{
  String? id; // we put ? mark because the string can be nullable or we can fill the value in it
  String? todoText;
  late bool isDone;

  ToDo(this.id,this.todoText,[this.isDone=false]); // constructor
  /*
  OR BY THIS the upper is known as positional arguments and the below is known as the named arguments
  /*ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,*/
  });
  */

  // static list is the type of list that belong to the class itself
static List<ToDo> todolist(){ // static list is created once and does not change
  return[  // todolist() is a name of the static list
   ];


}





}