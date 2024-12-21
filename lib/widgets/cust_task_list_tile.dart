import 'package:flutter/material.dart';
import 'package:to_do_list/screens/edItem.dart';
import 'package:to_do_list/database/task.dart';

class CustItemListTile extends StatelessWidget {
  final Task task;
  final VoidCallback refreshPg;
  const CustItemListTile(
      {super.key, required this.task, required this.refreshPg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        //navigate to page to edit transaction info
        String? received = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => EdItem(itemInfo: task)));
        if (received == 'refresh') {
          //refresh the page
          refreshPg.call();
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 85,
              child: Text(task.dueDate),
            ),
            SizedBox(
              width: 135,
              child: Text(task.taskTitle),
            ),
            SizedBox(
              width: 75,
              child: Text(task.status.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
