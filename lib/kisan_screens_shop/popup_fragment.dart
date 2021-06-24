import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'drop_down.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;


  const CustomDialogBox(
      { required this.title, required this.descriptions, required this.text,});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                left: Constants.padding,
                top: Constants.avatarRadius + Constants.padding,
                right: Constants.padding,
                bottom: Constants.padding),
            margin: EdgeInsets.only(top: Constants.avatarRadius),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(Constants.padding),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 10),
                      blurRadius: 10),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreenAccent,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreenAccent,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                DropDown(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.descriptions,
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 22,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        widget.text,
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            left: Constants.padding,
            right: Constants.padding,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: Constants.avatarRadius,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: //Image.asset("assets/model.jpeg")
                    Image.network(
                  'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
                  //  height: 250,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
