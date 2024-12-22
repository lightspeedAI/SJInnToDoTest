import 'package:to_do_list/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/screens/searchItem.dart';
import 'package:to_do_list/screens/view_tasks.dart';
import 'package:to_do_list/widgets/cust_icon.dart';
import 'add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              SizedBox(                
                height: MediaQuery.of(context).size.height* 0.5 ,                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomIcon(
                          insideIcon: Icon(
                            Icons.add_card,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 3.5,
                          ),
                          iconColor: color1,
                          textColor: Colors.white,
                          iconText: "Add Task",
                          pageToNav: (context) => const AddTask(),
                        ),
                        CustomIcon(
                          insideIcon: Icon(
                            Icons.view_list_rounded,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 3.5,
                          ),
                          iconColor: color3,
                          textColor: Colors.white,
                          iconText: "View Tasks",
                          pageToNav: (context) => const ViewTasks(),
                        ),
                        
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomIcon(
                          insideIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 3.5,
                          ),
                          iconColor: color2,
                          textColor: Colors.white,
                          iconText: "Search Tasks",
                          pageToNav: (context) => const SearchItem(),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                        )
                      ],
                    ),                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
