enum TaskFilter { all, done, deleted }

class Task {
  String taskName;
  bool toDone;
  bool editMode;
  TaskFilter taskFilter;
  bool isDeleted;

  Task(
      {this.taskName,
      this.toDone,
      this.editMode,
      this.taskFilter,
      this.isDeleted});
}

List<Task> taskList = [
  Task(taskName: "a", toDone: false, editMode: false, isDeleted: false),
  Task(taskName: "bbbb", toDone: false, editMode: false, isDeleted: false),
  Task(taskName: "cccc", toDone: false, editMode: false, isDeleted: false),
  Task(taskName: "ddddd", toDone: false, editMode: false, isDeleted: false),
  Task(taskName: "eeeee", toDone: false, editMode: false, isDeleted: false),
  Task(taskName: "ffffff", toDone: false, editMode: false, isDeleted: false),
  Task(
      taskName: "ggggggggggggg",
      toDone: false,
      editMode: false,
      isDeleted: false),
  Task(taskName: "hhhhh", toDone: false, editMode: false, isDeleted: false),
  Task(taskName: "jjjjj", toDone: false, editMode: false, isDeleted: false),
  Task(
      taskName: "kkkkkkkkkkkkkkkkk",
      toDone: false,
      editMode: false,
      isDeleted: false),
  Task(taskName: "lllllll", toDone: false, editMode: false, isDeleted: false),
  Task(taskName: "mmm", toDone: false, editMode: false, isDeleted: false),
  Task(taskName: "nnnnnnnn", toDone: false, editMode: false, isDeleted: false),
  Task(taskName: "ooooooo", toDone: false, editMode: false, isDeleted: false),
  Task(taskName: "pppp", toDone: false, editMode: false, isDeleted: false),
  Task(taskName: "rrrrrrrrr", toDone: false, editMode: false, isDeleted: false),
];
