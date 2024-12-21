import 'package:to_do_list/constants/styles.dart';
import 'package:to_do_list/widgets/cust_button.dart';
import 'package:to_do_list/widgets/cust_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/database/DB.dart';
import 'package:to_do_list/database/task.dart';
import 'package:to_do_list/widgets/cust_task_list_tile.dart';

class EditItem extends StatefulWidget {
  const EditItem({super.key});

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  List<Widget> itemTiles = [];
  TextEditingController purchaseMonth = TextEditingController();

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: pageBgCol,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:
            
            SizedBox(
          
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: SizedBox(
                  child: Text(
                    "Edit Tasks",
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
                      CustDatePicker(
                          dateCont: startDate, hintText: 'Start Date'),
                      CustDatePicker(dateCont: endDate, hintText: 'End Date'),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  CustButton(
                      innerText: 'Display Tasks',
                      onTP: dispItems,                      
                      wid: MediaQuery.of(context).size.width * 0.94,
                      heig: MediaQuery.of(context).size.width * 0.15),

                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              itemTiles.isEmpty
                  ? Container()
                  : Container(                 
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: const BoxDecoration(
                        color: Colors.white,                        
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(                            
                            width: 85,
                            child: Text('Due Date'),
                          ),
                          SizedBox(                            
                            width: 135,
                            child: Text('Task Name'),
                          ),
                          SizedBox(                            
                            width: 75,
                            child: Text('Status'),
                          ),                          
                        ],
                      ),
                    ),
              SizedBox(
                // color: Colors.red,
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.95,
                child: ListView(
                  children: itemTiles,
                ),
              ),
            ],
          ),
        ),
        //   ],
        // ),
      ),
    );
  }

  dispItems() async {
    bool fieldsFilled = checkFields(startDate.text, endDate.text);
    if (fieldsFilled) {
      //Make sDate have the start date selected
      String sDateText = startDate.text;
      String eDateText = endDate.text;
      List<String> sDateList = sDateText.split("-");
      List<String> eDateList = eDateText.split("-");
      DateTime starDate = DateTime(
        int.parse(sDateList[0]),
        int.parse(sDateList[1]),
        int.parse(sDateList[2]),
      );
      DateTime enDate = DateTime(
        int.parse(eDateList[0]),
        int.parse(eDateList[1]),
        int.parse(eDateList[2]),
      );

      //checking if date selected
      if (sDateText != "" &&
          sDateText != "null" &&
          eDateText != "" &&
          eDateText != "null") {
        List<Widget> taskInfoTiles = [];

        while (
            starDate.millisecondsSinceEpoch <= enDate.millisecondsSinceEpoch) {
          List<String> dateList = starDate.toString().split(" ");
          sDateText = dateList[0];

          //Load Add transactions done on start date
          List<Task> dayTasks = await ComDB.showDayTasks(sDateText);

          //Add all the expenses from those transactions
          if (dayTasks.isNotEmpty) {
            for (int j = 0; j < dayTasks.length; j++) {
              // totalExpenses = totalExpenses + dayTasks[j].itemPrice;
              taskInfoTiles.add(CustItemListTile(
                task: dayTasks[j],
                refreshPg: reloadOnEdit,
              ));
              taskInfoTiles.add(const SizedBox(
                height: 10,
              ));
            }
          }
          // numberOfDays += 1;
          starDate =
              DateTime(starDate.year, starDate.month, (starDate.day + 1));
        }

        itemTiles = taskInfoTiles;
        setState(() {});

        //Display the values
      }
    } else {
      itemTiles = [];
      setState(() {});
    }
  }

  bool checkFields(
    String startDate,
    String endDate,
  ) {
    if (startDate == "" || startDate == "null") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              //title: Text("Success"),
              content: Text("Please select Start Date "),
            );
          });
      return false;
    }
    if (endDate == "" || endDate == "null") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              //title: Text("Success"),
              content: Text("Please select End Date "),
            );
          });
      return false;
    }

    return true;
  }

  reloadOnEdit() {
    dispItems();
  }
}
