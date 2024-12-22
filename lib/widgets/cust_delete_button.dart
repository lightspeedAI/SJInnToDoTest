import 'package:flutter/material.dart';
import 'package:to_do_list/constants/styles.dart';
import 'package:to_do_list/database/DB.dart';
import 'package:to_do_list/database/task.dart';

class CustDeleteButton extends StatelessWidget {
  
  
  final Task task;
  final VoidCallback refreshPg;
  CustDeleteButton({super.key,
  
  required this.task,
  required this.refreshPg
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        String? received = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
                // color: Colors.red,
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Delete Task?",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancel")),
                              ElevatedButton(
                                onPressed: () async{
                                  final navigator = Navigator.of(context);                                  
                                  
                                  // Code to Delete Task
                                  await ComDB.deleteTask(task.id);
                                  navigator.pop('refresh');
                                },
                                child: Text("Delete Task"),
                              ),
                              
                            ])
                      ])));
        });

        if (received == 'refresh') {
          //refresh the page
          refreshPg.call();
        }
        
      },
      child: Container(
                            width: 24,
                            height: 24,
                            // padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                color: colorFalse,
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(
                              size: 16,
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
    );
  }
}