import 'package:flutter/material.dart';
import 'package:to_do_list/constants/styles.dart';
import 'package:to_do_list/database/task.dart';
import 'package:to_do_list/screens/ed_item.dart';

class CustEditButton extends StatelessWidget {
  
  
  final VoidCallback refreshPg;
  final Task task;
  CustEditButton({super.key,
  required this.refreshPg,
  required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        //navigate to page to edit transaction info
        String? received = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => EdItem(itemInfo: task)));
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
                                color: color1,
                                borderRadius: BorderRadius.circular(100)),
                            child: const Icon(
                              size: 16,
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
    );
  }
}