import 'package:flutter/material.dart';
import 'package:todo_examples6/task.dart';

class FilterButtons extends StatelessWidget {
  final int taskListAllLength;
  final int taskListDoneLength;
  final int taskListDeletedLength;
  final Function setListFilter;
  final TaskFilter selectedFilter;
  const FilterButtons({
    Key key,
    this.taskListAllLength,
    this.setListFilter,
    this.taskListDoneLength,
    this.taskListDeletedLength,
    this.selectedFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 0),
      child: Column(
        children: [
          Text(
            "To Do List",
            style: TextStyle(fontSize: 20),
          ),
          Row(
            children: [
              FlatButton(
                  color: selectedFilter == TaskFilter.all
                      ? Colors.red
                      : Colors.white,
                  onPressed: () => setListFilter(TaskFilter.all),
                  child: Text("Total $taskListAllLength task(s)")),
              FlatButton(
                  color: selectedFilter == TaskFilter.done
                      ? Colors.red
                      : Colors.white,
                  onPressed: () => setListFilter(TaskFilter.done),
                  child: Text("$taskListDoneLength task(s) done")),
              FlatButton(
                  color: selectedFilter == TaskFilter.deleted
                      ? Colors.red
                      : Colors.white,
                  onPressed: () => setListFilter(TaskFilter.deleted),
                  child: Text("$taskListDeletedLength task(s) deleted")),
            ],
          ),
        ],
      ),
    );
  }
}
