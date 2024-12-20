import 'package:to_do_list/screens/viewExpenses2.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/cust_icon.dart';
import 'package:to_do_list/constants/styles.dart';

class ViewExpenses1 extends StatefulWidget {
  const ViewExpenses1({super.key});

  @override
  State<ViewExpenses1> createState() => _ViewExpenses1State();
}

class _ViewExpenses1State extends State<ViewExpenses1> {
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [                        

                        CustomIcon(
                          insideIcon: Icon(
                            Icons.calendar_month_rounded,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 3.5,
                          ),
                          iconColor: color2,
                          textColor: Colors.white,
                          iconText: "By Date",
                          pageToNav: (context) =>
                              const ViewExpenses2(modeType: "date"),
                        ),

                        CustomIcon(
                          insideIcon: Icon(
                            Icons.bar_chart_rounded,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width / 3.5,
                          ),
                          iconColor: color3,
                          textColor: Colors.white,
                          iconText: "By Category",
                          pageToNav: (context) =>
                              const ViewExpenses2(modeType: "category"),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        //   ],
        // ),
      ),
    );
  }
}
