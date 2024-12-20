import 'package:to_do_list/constants/styles.dart';
import 'package:to_do_list/widgets/cust_button.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/database/DB.dart';
import 'package:to_do_list/database/task.dart';
import 'package:to_do_list/widgets/cust_text_input.dart';
import 'package:to_do_list/widgets/cust_text_input2.dart';
import 'package:to_do_list/widgets/cust_date_picker.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController desc = TextEditingController();

  TextEditingController taskTitle = TextEditingController();
  TextEditingController dueDate = TextEditingController();
  // TextEditingController desc = TextEditingController(); 

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
                    "Enter Task Details",
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
                      CustDatePicker(
                        dateCont: dueDate,
                        hintText: 'Due Date',
                      ),                      
                    ],
                  ),
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
                      innerText: 'Add Task',
                      onTP: () {
                        AddTask(taskTitle.text, dueDate.text, desc.text,);
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

  bool checkFields(
    String title,
    String dueDate,
    String desc,
    // int itemPr,
  ) {
    if (title == "") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              //title: Text("Success"),
              content: Text("Please enter item name "),
            );
          });
      return false;
    }
    if (dueDate == "" || dueDate == "null") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              //title: Text("Success"),
              content: Text("Please enter purchase date "),
            );
          });
      return false;
    }
    if (desc == "") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              //title: Text("Success"),
              content: Text("Please enter desc"),
            );
          });
      return false;
    }
    // if (itemPr.toString() == "") {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return const AlertDialog(
    //           //title: Text("Success"),
    //           content: Text("Please enter item price "),
    //         );
    //       });
    //   return false;
    // }

    return true;
  }

  goBack() {
    Navigator.pop(context);
  }

  AddTask(String title, String dueDate, String desc,) async {
    //Checking if all data is typed

    bool fieldsFilled = checkFields(title, dueDate, desc);

    if (fieldsFilled) {
      List<Task>? allItems;
      allItems = await ComDB.showAllData();

      if (allItems.isEmpty) {
        //Adding data to the local database
        var trans = Task(
            id: 1,
            taskTitle: title,
            dueDate: dueDate,
            desc: desc,
            // desc: itemPr
            );
        await ComDB.insertData(trans);
      } else {
        int index = allItems[allItems.length - 1].id;
        index += 1;

        var trans = Task(
            id: index,
            taskTitle: title,
            dueDate: dueDate,
            desc: desc,
            // desc: itemPr
            );
        await ComDB.insertData(trans);
      }
      goBack();
    }
  }
}
