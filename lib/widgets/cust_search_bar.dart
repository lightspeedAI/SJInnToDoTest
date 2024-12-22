import 'package:to_do_list/constants/styles.dart';
import 'package:flutter/material.dart';

class CustSearchBar extends StatefulWidget {
  final String hint;
  final Color backColor;
  final Color textColor;
  final Color hintColor;  
  final TextEditingController textCont;

  const CustSearchBar({super.key,
  required this.hint,
      required this.backColor,
      required this.textColor,
      required this.textCont,
      required this.hintColor,     
      
  });

  @override
  State<CustSearchBar> createState() => _CustSearchBarState();
}

class _CustSearchBarState extends State<CustSearchBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        width: MediaQuery.of(context).size.width * 0.94,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
            color: inputBgColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: TextField(          
          controller: widget.textCont,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: inputHintColor,
                fontSize: normalFontSize,
              )),
          style: TextStyle(fontSize: normalFontSize, color: widget.textColor),
          maxLines: 1,
        )));
  }
}