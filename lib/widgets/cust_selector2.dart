import 'package:to_do_list/constants/styles.dart';
import 'package:flutter/material.dart';

class CustSelector2 extends StatefulWidget {
  final List<String> droItems;
  final String dropdownDesc;
  final TextEditingController category;
  final String? initValue;

  const CustSelector2({
    super.key,
    required this.droItems,
    required this.dropdownDesc,
    required this.category,
    this.initValue,
  });

  @override
  State<CustSelector2> createState() => _CustSelector2State();
}

class _CustSelector2State extends State<CustSelector2> {
  String dropdownValue = "";
  String hin = "";

  @override
  void initState() {
    if (widget.initValue != null) {
      dropdownValue = widget.initValue!;
    } else {
      dropdownValue = widget.droItems.first;
    }

    widget.category.text = widget.droItems.first;
    hin = widget.dropdownDesc;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: selectorBgColor,
            ),
            child: DropdownButton<String>(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              hint: Text(hin),
              value: dropdownValue,
              dropdownColor: selectorBgColor,
              elevation: 1,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                  widget.category.text = value;
                });
              },
              items:
                  widget.droItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
            )));
  }
}
