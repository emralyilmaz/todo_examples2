import 'package:flutter/material.dart';
import 'package:todo_examples6/screen/add_task_screen.dart';
import 'package:todo_examples6/task.dart';
import 'package:todo_examples6/widgets/filter_buttons.dart';
import 'package:todo_examples6/widgets/task_list_item.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TaskFilter _selectedTaskFilter = TaskFilter.all;
  var _filteredList = [...taskList];
  var _rawList = [...taskList];

  _filterData(TaskFilter filter) {
    setState(() {
      _selectedTaskFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    var allList = _rawList.where((e) => e.isDeleted == false).toList();
    var doneList = _rawList
        .where((e) => e.toDone == true && e.isDeleted == false)
        .toList();
    var deletedList = _rawList.where((e) => e.isDeleted == true).toList();

    switch (_selectedTaskFilter) {
      case TaskFilter.all:
        _filteredList = allList;
        break;
      case TaskFilter.done:
        _filteredList = doneList;
        break;
      case TaskFilter.deleted:
        _filteredList = deletedList;
        break;
      default:
        break;
    }
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          String newTaskName = await showModalBottomSheet(
              context: context,
              builder: (context) {
                return AddTaskScreen();
              });
          print(newTaskName);

          setState(() {
            _rawList.add(Task(
                taskName: newTaskName,
                toDone: false,
                editMode: false,
                isDeleted: false,
                taskFilter: TaskFilter.all));
          });
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            FilterButtons(
                selectedFilter: _selectedTaskFilter,
                taskListAllLength: allList.length,
                taskListDoneLength: doneList.length,
                taskListDeletedLength: deletedList.length,
                setListFilter: (TaskFilter filter) => _filterData(filter)),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.all(10),
                padding:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 100),
                height: double.minPositive,
                width: 550,
                child: ListView.builder(
                    itemCount: _filteredList.length,
                    itemBuilder: (context, index) {
                      Task item = _filteredList[index];
                      return TaskListTile(
                        item: item,
                        changeCheckbox: (bool val) {
                          setState(() {
                            item.toDone = val;
                          });
                        },
                        setEditMode: (bool val) {
                          setState(() {
                            item.editMode = val;
                          });
                        },
                        onSave: (String val) {
                          setState(() {
                            item.taskName = val;
                            item.editMode = false;
                          });
                        },
                        onDelete: () {
                          setState(() {
                            item.isDeleted = true;
                          });
                        },
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
