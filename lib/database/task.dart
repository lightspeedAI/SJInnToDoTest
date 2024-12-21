class Task {

  // Init
  final int id;
  final String taskTitle;
  final String dueDate;
  final String desc;
  final String status;
  final String creationDate;
  final String updatedDate;
  // final int itemPrice;
 
 
  Task({
    required this.id,
    required this.taskTitle,
    required this.dueDate,
    required this.desc,
    required this.status,
    required this.creationDate,
    required this.updatedDate,
    // required this.itemPrice,
  });

  // toMap()
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "taskTitle": taskTitle,
      "dueDate": dueDate,
      "desc": desc,
      "status": status,
      "creationDate":creationDate,
      "updatedDate":updatedDate,
      // "itemPrice": itemPrice,
    };
  }

  @override
  String toString() {
    return "Task{\n  id: $id\n  taskTitle: $taskTitle\n  dueDate: $dueDate\n  desc: $desc\n  status: $status\n  creationDate: $creationDate\n  updatedDate: $updatedDate\n}\n\n";
  }
}
