import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
  
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'TodoApp',
      home: new TodoList(),
    );
  }


}

class TodoList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }

}

