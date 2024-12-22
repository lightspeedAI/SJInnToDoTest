import 'package:flutter/material.dart';
import 'package:to_do_list/database/task.dart';
import 'package:to_do_list/widgets/cust_delete_button.dart';
import 'package:to_do_list/widgets/cust_edit_button.dart';

class CustTaskTile2 extends StatelessWidget {
  final Task task;
  final VoidCallback refreshPg;
  CustTaskTile2({super.key, required this.task, required this.refreshPg});

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
          Container(
              // color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.16,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.89,
                          child: Text(task.taskTitle),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.89,
                          child: Text(
                            task.desc,
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            // color: Colors.blue,
            height: MediaQuery.of(context).size.height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      // width: 85,
                      child: Text(
                        "Task Id: ${task.id}",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    SizedBox(
                      // width: 85,
                      child: Text(
                        "Created",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    SizedBox(
                      // width: 85,
                      child: Text(
                        task.creationDate,
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      // width: 85,
                      child: Text(
                        "Updated",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    SizedBox(
                      // width: 85,
                      child: Text(
                        task.updatedDate,
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      // width: 75,
                      child: Text(
                        task.status,
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    SizedBox(
                      // width: 85,
                      child: Text(
                        "Due Date",
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                    SizedBox(
                      // width: 85,
                      child: Text(
                        task.dueDate,
                        style: TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 75,
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustEditButton(refreshPg: refreshPg, task: task,),

                          CustDeleteButton(refreshPg: refreshPg, task: task,),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
