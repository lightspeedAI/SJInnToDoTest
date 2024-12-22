import 'package:to_do_list/constants/styles.dart';
import 'package:to_do_list/widgets/cust_button.dart';
// import 'package:to_do_list/widgets/cust_nav_bar.dart';
import 'package:to_do_list/widgets/cust_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/database/DB.dart';
import 'package:to_do_list/database/task.dart';
// import 'package:to_do_list/widgets/cust_task_list_tile.dart';
import 'package:to_do_list/widgets/cust_task_tile2.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  List<Widget> itemTiles = [];
  TextEditingController purchaseMonth = TextEditingController();

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  TextEditingController searchKeyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: pageBgCol,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  CustSearchBar(
                      hint: "Enter Keyword to search Expenses",
                      backColor: Colors.grey[100]!,
                      textColor: Colors.black,
                      textCont: searchKeyword,
                      hintColor: Colors.grey),
                  const SizedBox(
                    height: 15,
                  ),
                  CustButton(
                      innerText: 'Search',
                      onTP: dispItems,
                      wid: MediaQuery.of(context).size.width * 0.94,
                      heig: MediaQuery.of(context).size.width * 0.15),
                ],
              ),              

              SizedBox(                
                height: MediaQuery.of(context).size.height * 0.7,
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
    bool fieldsFilled = checkFields(searchKeyword.text);
    if (fieldsFilled) {
      //checking if date selected
      if (searchKeyword.text != "" && searchKeyword.text != "null") {
        List<Widget> taskInfoTiles = [];

        // Load tasks that have title like what is typed
        List<Task> taskByTitle = await ComDB.searchByTitle(searchKeyword.text);

        if (taskByTitle.isNotEmpty) {
          for (int j = 0; j < taskByTitle.length; j++) {
            taskInfoTiles.add(CustTaskTile2(
              task: taskByTitle[j],
              refreshPg: reloadOnEdit,
            ));
            taskInfoTiles.add(const SizedBox(
              height: 10,
            ));
          }
        }

        //Display the values
        itemTiles = taskInfoTiles;
        setState(() {});
      }
    } else {
      itemTiles = [];
      setState(() {});
    }
  }

  bool checkFields(
    String keyWord,
  ) {
    if (keyWord == "" || keyWord == "null") {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              //title: Text("Success"),
              content: Text("Please Enter Title to Search "),
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
