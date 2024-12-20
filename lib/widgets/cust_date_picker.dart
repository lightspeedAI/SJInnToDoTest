import 'package:to_do_list/constants/styles.dart';
import 'package:flutter/material.dart';

class CustDatePicker extends StatefulWidget {
  final TextEditingController dateCont;
  final String hintText;
  const CustDatePicker({
    super.key,
    required this.dateCont,
    required this.hintText,
  });

  @override
  State<CustDatePicker> createState() => _CustDatePickerState();
}

class _CustDatePickerState extends State<CustDatePicker> {
  String hint = "";
  @override
  void initState() {
    hint = widget.hintText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime selectedDate = DateTime.now();
        final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2000, 1),
            lastDate: DateTime(2101));

        List<String> dateList = picked.toString().split(" ");

        widget.dateCont.text = dateList[0];
        setState(() {});
      },
      child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
              color: custDatePickBgCol,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Center(
              child: TextField(
            controller: widget.dateCont,
            decoration: InputDecoration(
                enabled: false,
                border: InputBorder.none,
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                )),
            style: const TextStyle(fontSize: 20, color: Colors.black),
            maxLines: 3,
          ))),
    );
  }
}
