import 'package:flutter/material.dart';
import 'package:to_do_list/database/task.dart';

class CustTaskTile2 extends StatelessWidget {
  final Task task;
  CustTaskTile2({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 85,
                child: Text(task.id.toString()),
              ),
              SizedBox(
                width: 75,
                child: Text(task.status),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 85,
                child: Text(task.taskTitle),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 85,
                child: Text(task.desc),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 85,
                child: Text("Created"),
              ),
              SizedBox(
                width: 85,
                child: Text("Updated"),
              ),
              SizedBox(
                width: 85,
                child: Text("Due Date"),
              ),
              
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 85,
                child: Text(task.creationDate),
              ),
              SizedBox(
                width: 85,
                child: Text(task.updatedDate),
              ),
              SizedBox(
                width: 85,
                child: Text(task.dueDate),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
