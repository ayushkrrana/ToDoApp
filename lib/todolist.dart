
import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todoss;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem({super.key,required this.todoss,required this.onToDoChanged,required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListTile(
          onTap: (){
            onToDoChanged(todoss);
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Colors.white,
          leading: Icon(todoss.isDone? Icons.check_box: Icons.check_box_outline_blank,color: Colors.black,size: 25,),
          title: Text(todoss.todoText!,style: TextStyle(color: Colors.black, //! it shows that this value can not be null
          fontSize: 18,fontWeight: FontWeight.w500,
          decoration: todoss.isDone? TextDecoration.lineThrough:null),
          ),
          trailing: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: IconButton(onPressed:(){
              onDeleteItem(todoss.id);
            } , icon: Icon(Icons.delete),
            iconSize: 25,
            padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
            ),
          ),


        ),
      ),
    );
  }
}
