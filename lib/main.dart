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
      //home: new TodoApp(),
      theme: new ThemeData.dark(),
    );
  }
}

class TodoApp extends State {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Todo App'),
      ),
      body:,
      floatingActionButton: floatingActionButton(),
    );
  }

  Widget floatingActionButton() {
    return new FloatingActionButton(
      tooltip: "Add Todo",
      onPressed: _onFABClick,
      child: new Icon(Icons.add),
    );
  }

  void _onFABClick() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {

    }));
  }

}

