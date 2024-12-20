import 'package:to_do_list/constants/styles.dart';
import 'package:flutter/material.dart';

class CustTextInput2 extends StatefulWidget {
  final String hint;
  final Color backColor;
  final Color textColor;
  final Color hintColor;
  final int? lines;
  final TextEditingController textCont;
  final TextInputType? keyType;

  const CustTextInput2(
      {super.key,
      required this.hint,
      required this.backColor,
      required this.textColor,
      required this.textCont,
      required this.hintColor,
      this.keyType,
      this.lines});

  @override
  State<CustTextInput2> createState() => _CustTextInput2State();
}

class _CustTextInput2State extends State<CustTextInput2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        width: MediaQuery.of(context).size.width * 0.93,
        height: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
            color: inputBgColor,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Center(
            child: TextField(
          keyboardType: widget.keyType,
          controller: widget.textCont,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
              hintStyle: TextStyle(
                color: inputHintColor,
                fontSize: normalFontSize,
              )),
          style: TextStyle(fontSize: normalFontSize, color: widget.textColor),
          maxLines: widget.lines ?? 1,
        )));
  }
}
