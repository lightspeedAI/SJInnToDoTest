import 'package:to_do_list/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final Color iconColor;
  final Color textColor;
  final String iconText;
  final Icon insideIcon;
  final Widget Function(BuildContext) pageToNav;

  const CustomIcon({
    super.key,
    required this.iconColor,
    required this.textColor,
    required this.iconText,
    required this.insideIcon,
    required this.pageToNav,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: pageToNav));
        },
        child: Container(
            width: MediaQuery.of(context).size.width / 2.2,
            height: MediaQuery.of(context).size.width / 2.2,
            decoration: BoxDecoration(
                color: iconColor,
                border: Border.all(
                  color: iconColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).size.width / 3.5,
                    child: insideIcon,
                  ),
                  Text(
                    iconText,
                    style: TextStyle(color: textColor, fontSize: iconFontSize),
                  ),
                ])));
  }
}
