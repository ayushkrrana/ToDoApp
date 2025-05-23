
import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todoss;// create a variable which will be of ToDo class type
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
          leading: Icon(todoss.isDone? Icons.check_box: Icons.check_box_outline_blank,color: Colors.black,size: 25,),// leading is for the top left corner
          title: Text(todoss.todoText!,style: TextStyle(color: Colors.black, //! it shows that this value can not be null and we pass the variable todoss with the class member which is todotext in the ToDo class
          fontSize: 18,fontWeight: FontWeight.w500,
          decoration: todoss.isDone? TextDecoration.lineThrough:null),//?-if then this :-else this //line through draws a line when the item is checked
          ),
          trailing: Container(// trailing is for the top right corner
            height: 32,
            width: 32,
            decoration: BoxDecoration(// box decoration is used inside the container
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
