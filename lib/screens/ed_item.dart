import 'package:to_do_list/constants/styles.dart';
import 'package:to_do_list/widgets/cust_button.dart';
import 'package:to_do_list/widgets/cust_check.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/database/DB.dart';
import 'package:to_do_list/database/task.dart';
import 'package:to_do_list/widgets/cust_text_input.dart';
import 'package:to_do_list/widgets/cust_text_input2.dart';

class EdItem extends StatefulWidget {
  final Task itemInfo;

  const EdItem({
    super.key,
    required this.itemInfo,
  });

  @override
  State<EdItem> createState() => _EdItemState();
}

class _EdItemState extends State<EdItem> {
  TextEditingController taskTitle = TextEditingController();
  TextEditingController dueDate = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController creDate = TextEditingController();
  TextEditingController upDate = TextEditingController();
  TextEditingController taskStatus = TextEditingController();

  Task taskFullInfo = Task(
    id: 1,
    taskTitle: "taskTitle",
    dueDate: "dueDate",
    desc: "desc",
    status: "status",
    creationDate: "creationDate",
    updatedDate: "updatedDate",
  );

  @override
  void initState() {
    taskFullInfo = widget.itemInfo;
    taskTitle.text = taskFullInfo.taskTitle;
    dueDate.text = taskFullInfo.dueDate;
    desc.text = taskFullInfo.desc;
    taskStatus.text = taskFullInfo.status;
    creDate.text = taskFullInfo.creationDate;
    upDate.text = taskFullInfo.updatedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: pageBgCol,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: SizedBox(
                  child: Text(
                    "Task Info",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustTextInput(
                          hint: "Title",
                          backColor: Colors.grey[100]!,
                          textColor: Colors.black,
                          lines: 3,
                          textCont: taskTitle,
                          hintColor: Colors.grey,
                        ),
                        CustCheck(
                          textCont: taskStatus,
                          textColor: Colors.black,
                        ),
                      ]),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustTextInput2(
                        hint: "Description",
                        backColor: Colors.grey[100]!,
                        textColor: Colors.black,
                        textCont: desc,
                        hintColor: Colors.grey,
                        lines: 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustButton(
                      innerText: 'Edit Task',
                      onTP: () {
                        bool fieldsFilled = checkFields(
                            taskTitle.text,
                            dueDate.text,
                            desc.text,
                            taskStatus.text,
                            creDate.text,
                            upDate.text);
                        if (fieldsFilled) {
                          editTask(
                              widget.itemInfo.id,
                              taskTitle.text,
                              dueDate.text,
                              desc.text,
                              taskStatus.text,
                              creDate.text,
                              upDate.text);
                          Navigator.pop(context, 'refresh');
                        }
                      },
                      wid: MediaQuery.of(context).size.width * 0.94,
                      heig: MediaQuery.of(context).size.width * 0.15),
                ],
              )
            ],
          ),
        ),
        //   ],
        // ),
      ),
    );
  }

  bool checkFields(String taskTl, String dueDate, String descr, String status,
      String cDate, String uDate) {
    if (taskTl == "") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              content: Text("Please enter task title"),
            );
          });
      return false;
    }
    if (dueDate == "" || dueDate == "null") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              content: Text("Please enter due date "),
            );
          });
      return false;
    }
    return true;
  }

  editTask(
    int Id,
    String taskTl,
    String dueDate,
    String descr,
    String status,
    String creaDate,
    String updaDate,
  ) async {
    // Adding todays date as the updated date
    DateTime selectedDate = DateTime.now();
    List<String> dateList = selectedDate.toString().split(" ");
    String todaysDate = dateList[0];

    var trans = Task(
      id: Id,
      taskTitle: taskTl,
      dueDate: dueDate,
      desc: descr,
      status: status,
      creationDate: creaDate,
      updatedDate: todaysDate,
    );
    await ComDB.updateData(trans);
    // }
  }
}
