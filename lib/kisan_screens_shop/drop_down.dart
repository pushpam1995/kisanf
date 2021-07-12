import 'package:flutter/material.dart';

import 'list_category.dart';

class DropDown extends StatefulWidget {
  final Function setcategoryaddress;
  DropDown({required this.setcategoryaddress});
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String a = "Choose Category";
  void changeCat(value) {
    setState(() {
      a = value;
      widget.setcategoryaddress(a);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: Category().cato.map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      hint: Text(
        a,
        style: TextStyle(color: Theme.of(context).accentColor),
      ),
      onChanged: (value) => changeCat(value),
    );
  }
}
