import 'package:flutter/material.dart';
import 'package:todolist/constants/colors.dart';
import 'package:todolist/model/ToDo.dart';
import 'package:todolist/widgets/todo_item.dart';

import '../widgets/search_bar_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ToDo> toDoList = [
    ToDo(id: "1", textContent: "task1"),
    ToDo(id: "2", textContent: "task2"),
    ToDo(id: "3", textContent: "task3")
  ];
  List<ToDo> _searchResultList = [];

  final _todoController = TextEditingController();

  void _handleIsDoneChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _addToDoItem(String textContent) {
    setState(() {
      if (textContent.length > 0) {
        toDoList.add(ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            textContent: textContent));
      }
    });
    _todoController.clear();
  }

  void _deleteToDoItem(String id) {
    setState(() {
      toDoList.removeWhere((item) => item.id == id);
    });
  }

  void runSearchFilter(String search) {
    List<ToDo> resultsArray = [];

    if (search.isEmpty) {
      resultsArray = toDoList;
    } else {
      resultsArray = toDoList
          .where((item) =>
              item.textContent!.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    setState(() {
      _searchResultList = resultsArray;
    });
  }

  @override
  void initState() {
    _searchResultList = toDoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    searchBarWidget(context, runSearchFilter),
                    Expanded(
                        child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 50,
                            bottom: 20,
                          ),
                          child: const Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        for (ToDo iterableTodo in _searchResultList)
                          ToDoItem(
                            todo: iterableTodo,
                            onToDoChanged: _handleIsDoneChange,
                            onDeleteItem: _deleteToDoItem,
                          ),
                      ],
                    )),
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                          hintText: "Add a new task", border: InputBorder.none),
                    ),
                  )),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                      child: Text("+",
                          style: TextStyle(fontSize: 40, color: white)),
                      onPressed: () {
                        _addToDoItem(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: blue,
                          minimumSize: Size(60, 60),
                          elevation: 2),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      title:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: []),
    );
  }
}
