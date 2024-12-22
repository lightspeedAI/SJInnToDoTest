import 'package:flutter/material.dart';
import 'package:to_do_list/constants/styles.dart';
import 'package:to_do_list/database/DB.dart';
import 'package:to_do_list/database/task.dart';
import 'package:to_do_list/widgets/cust_task_tile2.dart';

class ViewTasks extends StatefulWidget {
  const ViewTasks({super.key});

  @override
  State<ViewTasks> createState() => _ViewTasksState();
}

class _ViewTasksState extends State<ViewTasks> {
  List<Widget> itemTiles = [];

  @override
  void initState() {
    displayAllTasks();
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
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: SizedBox(
                  child: Text(
                    "View Tasks",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(                
                height: MediaQuery.of(context).size.height * 0.75,
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

  displayAllTasks() async {
    List<Task> allTasks = await ComDB.showAllData();
    List<Widget> taskInfoTiles = [];
    if (allTasks.isNotEmpty) {
      for (int j = 0; j < allTasks.length; j++) {
        taskInfoTiles.add(CustTaskTile2(task: allTasks[j], refreshPg: reloadOnEdit,));
        taskInfoTiles.add(const SizedBox(
          height: 10,
        ));
      }
    }

    itemTiles = taskInfoTiles;
    setState(() {});
  }

  reloadOnEdit() {
    displayAllTasks();
  }
}
