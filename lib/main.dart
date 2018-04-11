import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class TodoItem {
  const TodoItem({this.title, this.todoText});

  final String title;
  final String todoText;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TodoApp',
      home: new MyTodoApp(),
      theme: new ThemeData.dark(),
    );
  }
}

class MyTodoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new TodoApp();
}

class TodoApp extends State<MyTodoApp> {
  final Set<TodoItem> todos = new Set<TodoItem>();

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text('Todo App'),
          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.group_add,
                  size: 150.0,
                ),
                new Text('Add Todos', style: new TextStyle(fontSize: 30.0),)
              ],
            ),
          ),
          floatingActionButton: floatingActionButton());
    }
    final todoListItems = todos.map((todo) {
      return new ListTile(
        title: new Text(
          todo.title,
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        subtitle: new Text(
          todo.todoText,
          style: new TextStyle(fontSize: 22.0),
        ),
      );
    }).toList();

    final divided =
        ListTile.divideTiles(tiles: todoListItems, context: context).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo App'),
      ),
      body: new ListView(
        children: divided,
      ),
      floatingActionButton: floatingActionButton(),
    );
  }

  Widget floatingActionButton() {
    String title, todoMsg;
    final Widget titleTextField = new TextField(
      onChanged: (String t) {
        title = t;
      },
      autofocus: true,
      decoration: new InputDecoration(
          labelText: 'Todo Title',
          labelStyle:
              new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          hintText: 'Complete Work'),
    );

    final Widget todoMsgTextField = new TextField(
      onChanged: (String t) {
        todoMsg = t;
      },
      autofocus: true,
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      decoration: new InputDecoration(
          labelText: 'Todo Details',
          labelStyle:
              new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          hintText: 'Have to be completed by next week'),
    );

    void _addTodoItem(TodoItem todo) {
      setState(() {
        todos.add(todo);
      });
    }

    final submitButton = new FlatButton(
      onPressed: () {
        Navigator.of(context).pop(context);
        print(title + "Msg is " + todoMsg);

        _addTodoItem(new TodoItem(title: title, todoText: todoMsg));
        title = "";
        todoMsg = "";
      },
      child: new Text("SUBMIT"),
      padding: new EdgeInsets.all(15.0),
    );
    final SimpleDialog simpleDialog = new SimpleDialog(
      title: new Text("Add Todo"),
      contentPadding: new EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 15.0),
      children: <Widget>[titleTextField, todoMsgTextField, submitButton],
    );

    return new FloatingActionButton(
      tooltip: "Add Todo",
      onPressed: () {
        showDialog(
            context: context,
            child: new _SystemPadding(
              child: simpleDialog,
            ));
      },
      child: new Icon(Icons.add),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
