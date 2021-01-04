import 'package:flutter/material.dart';
import 'package:todo_examples6/task.dart';

class TaskListTile extends StatefulWidget {
  final Task item;
  final Function changeCheckbox;
  final Function setEditMode;
  final Function onSave;
  final Function onDelete;
  const TaskListTile({
    Key key,
    this.item,
    this.changeCheckbox,
    this.setEditMode,
    this.onSave,
    this.onDelete,
  }) : super(key: key);

  @override
  _TaskListTileState createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  var myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    myController.text = widget.item.taskName;
    return ListTile(
      leading: widget.item.editMode
          ? IconButton(
              icon: Icon(Icons.save),
              onPressed: () => widget.onSave(myController.text))
          : IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => widget.setEditMode(true)),
      title: widget.item.editMode
          ? TextField(controller: myController)
          : Text(widget.item.taskName),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            Checkbox(
                value: widget.item.toDone, onChanged: widget.changeCheckbox),
            IconButton(icon: Icon(Icons.delete), onPressed: widget.onDelete)
          ],
        ),
      ),
    );
  }
}
