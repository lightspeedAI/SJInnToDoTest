class Task {

  // Init
  final int id;
  final String taskTitle;
  final String dueDate;
  final String desc;
  // final int itemPrice;
 
 
  Task({
    required this.id,
    required this.taskTitle,
    required this.dueDate,
    required this.desc,
    // required this.itemPrice,
  });

  // toMap()
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "taskTitle": taskTitle,
      "dueDate": dueDate,
      "desc": desc,
      // "itemPrice": itemPrice,
    };
  }

  @override
  String toString() {
    return "Task{\n  id: $id\n  taskTitle: $taskTitle\n  dueDate: $dueDate\n  desc: $desc\n}\n\n";
  }
}
