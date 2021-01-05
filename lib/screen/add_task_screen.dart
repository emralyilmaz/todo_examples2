import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Add Your Task"),
          TextField(
            onChanged: (val) {
              newTask = val;
            },
          ),
          FlatButton(
              onPressed: () {
                Navigator.pop(context, newTask);
              },
              child: Text("Add"))
        ],
      ),
    );
  }
}
