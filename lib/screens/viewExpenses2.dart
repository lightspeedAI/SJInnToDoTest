import 'package:to_do_list/constants/styles.dart';
import 'package:to_do_list/widgets/cust_button.dart';
import 'package:to_do_list/widgets/cust_date_picker.dart';
import 'package:to_do_list/widgets/cust_selector2.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/database/DB.dart';
import 'package:to_do_list/database/task.dart';
import 'package:to_do_list/constants/constvals.dart';

class ViewExpenses2 extends StatefulWidget {
  final String modeType;

  const ViewExpenses2({super.key, required this.modeType});

  @override
  State<ViewExpenses2> createState() => _ViewExpenses2State();
}

class _ViewExpenses2State extends State<ViewExpenses2> { 
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController buttonName = TextEditingController();
  TextEditingController catgry = TextEditingController();

  String totalExpen = "";
  String averageExpen = "";
  String numOfDays = "";

  String mode = "";

  @override
  void initState() {
    mode = widget.modeType;
    super.initState();
  }

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
              Center(
                child: SizedBox(
                  child: Text(
                    mode == "date"
                        ? "Expenses by Date"
                        : "Expenses by Category",
                    style: const TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
              
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustDatePicker(dateCont: startDate, hintText: 'Start Date'),
                        CustDatePicker(dateCont: endDate, hintText: 'End Date'),                        
                      ],
                    ),

                    Row(
                      mainAxisAlignment: 
                      mode == "date"?
                      MainAxisAlignment.center: MainAxisAlignment.spaceAround,
                      children: [
                        mode == "date"
                            ? Container()
                            : CustSelector2(
                                droItems: catops,
                                dropdownDesc: "Category",
                                category: catgry),
                        CustButton(
                          innerText: "Show Expenses",
                          onTP:(){}, 
                          // showExpensesFn,
                          wid: MediaQuery.of(context).size.width * 0.45,
                          heig: MediaQuery.of(context).size.width * 0.2,
                        ),
                      ],
                    ),

                    
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              SizedBox(                
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ListView(
                  children: [
                    Text(totalExpen),
                    Text(averageExpen),
                    Text(numOfDays),
                  ],
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

  // showExpensesFn() async {
  //   bool fieldsFilled =
  //       checkFields(startDate.text, endDate.text);

  //   if (fieldsFilled) {
  //     if (mode == 'date') {
  //       //Make sDate have the start date selected
  //       String sDateText = startDate.text;
  //       String eDateText = endDate.text;
  //       List<String> sDateList = sDateText.split("-");
  //       List<String> eDateList = eDateText.split("-");
  //       DateTime starDate = DateTime(
  //         int.parse(sDateList[0]),
  //         int.parse(sDateList[1]),
  //         int.parse(sDateList[2]),
  //       );
  //       DateTime enDate = DateTime(
  //         int.parse(eDateList[0]),
  //         int.parse(eDateList[1]),
  //         int.parse(eDateList[2]),
  //       );

  //       double totalExpenses = 0;
  //       int numberOfDays = 0;
  //       double averageExpenses = 0;

  //       //checking if date selected
  //       if (sDateText != "" &&
  //           sDateText != "null" &&
  //           eDateText != "" &&
  //           eDateText != "null") {
  //         while (starDate.millisecondsSinceEpoch <=
  //             enDate.millisecondsSinceEpoch) {
  //           List<String> dateList = starDate.toString().split(" ");
  //           sDateText = dateList[0];

  //           //Load Add transactions done on start date
  //           List<Task> dayPurch = await ComDB.showDayTrans(sDateText);

  //           //Add all the expenses from those transactions
  //           if (dayPurch.isNotEmpty) {
  //             for (int j = 0; j < dayPurch.length; j++) {
  //               totalExpenses = totalExpenses + dayPurch[j].itemPrice;
  //             }
  //           }
  //           numberOfDays += 1;
  //           starDate =
  //               DateTime(starDate.year, starDate.month, (starDate.day + 1));
  //         }

  //         averageExpenses = totalExpenses / numberOfDays;

  //         totalExpen = "Total Expenses: $totalExpenses";
  //         averageExpen = "Average Expenses: $averageExpenses";
  //         numOfDays = "Number of Days: $numberOfDays";

  //         setState(() {});

  //         //Display the values
  //       }
  //     } else {
  //       //This part to calculate expense by category

  //       //Make sDate have the start date selected
  //       String sDateText = startDate.text;
  //       String eDateText = endDate.text;
  //       List<String> sDateList = sDateText.split("-");
  //       List<String> eDateList = eDateText.split("-");
  //       DateTime starDate = DateTime(
  //         int.parse(sDateList[0]),
  //         int.parse(sDateList[1]),
  //         int.parse(sDateList[2]),
  //       );
  //       DateTime enDate = DateTime(
  //         int.parse(eDateList[0]),
  //         int.parse(eDateList[1]),
  //         int.parse(eDateList[2]),
  //       );

  //       double totalExpenses = 0;
  //       int numberOfDays = 0;
  //       double averageExpenses = 0;

  //       //checking if date selected
  //       if (sDateText != "" &&
  //           sDateText != "null" &&
  //           eDateText != "" &&
  //           eDateText != "null") {
  //         while (starDate.millisecondsSinceEpoch <=
  //             enDate.millisecondsSinceEpoch) {
  //           List<String> dateList = starDate.toString().split(" ");
  //           sDateText = dateList[0];

  //           //Load Add transactions done on start date
  //           // List<Task> dayPurch = await ComDB.showDayTrans(sDateText);
  //           List<Task> dayPurch =
  //               await ComDB.showCatTrans(sDateText, catgry.text);

  //           //Add all the expenses from those transactions
  //           if (dayPurch.isNotEmpty) {
  //             for (int j = 0; j < dayPurch.length; j++) {
  //               totalExpenses = totalExpenses + dayPurch[j].itemPrice;
  //             }
  //           }
  //           numberOfDays += 1;
  //           starDate =
  //               DateTime(starDate.year, starDate.month, (starDate.day + 1));
  //         }

  //         averageExpenses = totalExpenses / numberOfDays;

  //         totalExpen = "Total Expenses: $totalExpenses";
  //         averageExpen = "Average Expenses: $averageExpenses";
  //         numOfDays = "Number of Days: $numberOfDays";

  //         setState(() {});

  //         //Display the values
  //       }
  //     }
  //   }
  // }

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
}
