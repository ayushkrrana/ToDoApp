import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/todo.dart';
import 'package:todo/todolist.dart';

class ToDoAppMaterial extends StatefulWidget {
  const ToDoAppMaterial({super.key});
  @override
  State createState() => _ToDoAppPage();
}

class _ToDoAppPage extends State {
  final toDosList = ToDo.todolist();
  List _foundToDo = [];

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      toDosList.removeWhere((item) => item.id == id);
    });
  }

  TextEditingController textEditingController1 = TextEditingController();

  void _addToDoItem(String toDoss) {
    setState(() {
      // i have to use the positional arguments not id:Datetime.now because i use this ToDo(this.id,this.todoText,[this.isDone=false]);
      toDosList.insert(
        0,
        ToDo(DateTime.now().millisecondsSinceEpoch.toString(), toDoss),
      );

    });
    textEditingController1.clear();
  }

  void _runFilter(String enterKeyword) {
    List results = [];
    if (enterKeyword.isEmpty) {
      results = toDosList;
    } else {
      results =
          toDosList
              .where(
                (item) => item.todoText!.toLowerCase().contains(
                  enterKeyword.toLowerCase(),
                ),
              )
              .toList();
    }
    setState(() {
      _foundToDo=results;
    });
  }

  @override
  void initState() {
    _foundToDo = toDosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,

      //--------------------------------APP BAR---------------------------------------
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: Colors.black, size: 30),
            Container(
              height: 40,
              width: 40,
              child: ClipOval(
                child: Image.asset('Assets/images/ak.jpg', fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
      //-------------------BODY PART-------------------------------
      body: Stack(
        // we wrap the column with the column to access the children because the stack used the children rather than child
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                child: TextField(
                  onChanged: (value)=>_runFilter(value),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    //prefixiconcontsraints-which is used to set height of the icon and width
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 20),
                        child: Text(
                          "All ToDos",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      for (ToDo todo in _foundToDo)
                        ToDoItem(
                          todoss: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, right: 5, left: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: textEditingController1,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Add a new ToDo's Item",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, top: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(textEditingController1.text);
                    },
                    child: Text('+', style: TextStyle(fontSize: 30)),
                    style: ElevatedButton.styleFrom(
                      // always use style form with elevated button or text button because it do not require to enter the material state property
                      shape: CircleBorder(),
                      backgroundColor: Colors.lightBlueAccent,
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
