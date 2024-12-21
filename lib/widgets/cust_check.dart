import 'package:flutter/material.dart';
import 'package:to_do_list/constants/styles.dart';

class CustCheck extends StatefulWidget {
  final TextEditingController textCont;
  final Color textColor;
  CustCheck({super.key, required this.textCont, required this.textColor});

  @override
  State<CustCheck> createState() => _CustCheckState();
}

class _CustCheckState extends State<CustCheck> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.textCont.text == "Incomplete") {
          widget.textCont.text = "Complete";
          setState(() {});
        } else if (widget.textCont.text == "Complete") {
          widget.textCont.text = "Incomplete";
          setState(() {});
        }
      },
      child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
              color:
                  widget.textCont.text == "Incomplete" ? colorFalse : colorTrue,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Center(
              child: Text(
            widget.textCont.text,
            style: TextStyle(fontSize: normalFontSize, color: widget.textColor),
          ))),
    );
  }
}
