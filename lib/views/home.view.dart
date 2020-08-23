import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/controllers/todo.controller.dart';
import 'package:todos/stores/app.store.dart';
import 'package:todos/views/create-todo.view.dart';
import 'package:todos/widgets/navbar.widget.dart';
import 'package:todos/widgets/todo-list.widget.dart';
import 'package:todos/widgets/user-card.widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new TodoController(store);

    // Só ocorre na primeira vez que o App rodar
    if (store.currentState == "none") controller.changeSelection("today");
    return Scaffold(
      body: Column(
        children: <Widget>[
          UserCard(),
          Navbar(),
          Expanded(
            child: Container(
              child: TodoList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateTodoView(),
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
