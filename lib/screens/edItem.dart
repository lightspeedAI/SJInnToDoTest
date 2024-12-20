import 'package:to_do_list/constants/constvals.dart';
import 'package:to_do_list/constants/styles.dart';
import 'package:to_do_list/widgets/cust_button.dart';
import 'package:to_do_list/widgets/cust_selector2.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/database/DB.dart';
import 'package:to_do_list/database/task.dart';
import 'package:to_do_list/widgets/cust_text_input.dart';
import 'package:to_do_list/widgets/cust_date_picker.dart';

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
  TextEditingController itemPrice = TextEditingController();
  TextEditingController taskTitle = TextEditingController();
  TextEditingController dueDate = TextEditingController();
  TextEditingController desc = TextEditingController();

  // int changed = 0;
  Task itemFullInfo = Task(
      id: 1,
      taskTitle: "taskTitle",
      dueDate: "dueDate",
      desc: "desc",
      // itemPrice: 1
      );

  @override
  void initState() {
    itemFullInfo = widget.itemInfo;
    // itemPrice.text = itemFullInfo.itemPrice.toString();
    taskTitle.text = itemFullInfo.taskTitle;
    dueDate.text = itemFullInfo.dueDate;
    desc.text = itemFullInfo.desc;

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
                    "Expense Info",
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
                          hint: "item Price",
                          backColor: Colors.grey[100]!,
                          textColor: Colors.black,
                          textCont: itemPrice,
                          hintColor: Colors.grey,
                          keyType: TextInputType.number,
                        ),
                        CustTextInput(
                          hint: "item name",
                          backColor: Colors.grey[100]!,
                          textColor: Colors.black,
                          lines: 3,
                          textCont: taskTitle,
                          hintColor: Colors.grey,
                        ),
                      ]),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // CustSelector2(
                      //   droItems: catops,
                      //   dropdownDesc: 'Category',
                      //   desc: desc,
                      //   initValue: desc.text,
                      // ),
                      CustDatePicker(
                        dateCont: dueDate,
                        hintText: 'Purchase Date',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustButton(
                      innerText: 'Edit Expense',
                      onTP: () {
                        bool fieldsFilled = checkFields(taskTitle.text, dueDate.text, desc.text, itemPrice.text);
                        if(fieldsFilled){
                          edTransaction(
                          widget.itemInfo.id,
                          taskTitle.text,
                          dueDate.text,
                          desc.text,
                          itemPrice.text,
                        );
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

  bool checkFields(
      String itemNm, String purDate, String categ, String itmPrice) {
    if (itemNm == "") {
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
    if (purDate == "" || purDate == "null") {
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
    if (categ == "") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              //title: Text("Success"),
              content: Text("Please select desc "),
            );
          });
      return false;
    }
    if (itmPrice == "") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              //title: Text("Success"),
              content: Text("Please enter item price"),
            );
          });
      return false;
    }
    return true;
  }

  edTransaction(int Id, String itemNm, String purDate, String categ,
      String itmPrice) async {
        
    //Checking if all data is typed
    // bool fieldsFilled = checkFields(itemNm, purDate, categ, itmPrice);

    //Code to update new transaction values into DB
    // if (fieldsFilled) {
    
      //Updating data in the local database
      var trans = Task(
          id: Id,
          taskTitle: itemNm,
          dueDate: purDate,
          desc: categ,
          // itemPrice: int.parse(itmPrice)
          );
      await ComDB.updateData(trans);
    // }
  }
}
