import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisan_dost_app/kisan_screens_shop/list_category.dart';
import 'package:kisan_dost_app/kisan_screens_shop/transaction.dart';
import 'package:kisan_dost_app/updateitem/updateimetmodel.dart';
import 'package:kisan_dost_app/updateitem/updateitemservice.dart';

import 'constants.dart';
import 'drop_down.dart';

class CustomDialogBox extends StatefulWidget {
  final String headline, descriptions, text;
  final String name;
  final String category;
  final double price;
  final int quantity;
  final int itemId;
  final String details;
  final int shopId;
  final int categoryId;

  const CustomDialogBox({
    required this.quantity,
    required this.details,
    required this.shopId,
    required this.categoryId,
    required this.name,
    required this.category,
    required this.price,
    required this.itemId,
    required this.headline,
    required this.descriptions,
    required this.text,
  });

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  String categorySelected = "";
  Future<UpdateItemModel>? _futureAlbum;
  TextEditingController textEditingControllerName = new TextEditingController();
  TextEditingController textEditingControllerAmount =
      new TextEditingController();

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

  void noUseFunction(value) {
    setState(() {
      categorySelected = value;
    });
  }

  sendAllDataForUpdation() {
    print(
        "inside sendAllDataForUpdation ${widget.itemId}, ${widget.name}, ${widget.details}, ${widget.shopId}, ${widget.price}, ${widget.quantity}, ${widget.categoryId}");
    setState(() {
      _futureAlbum = updateItem(
          widget.itemId,
          textEditingControllerName.text,
          widget.details,
          widget.shopId,
          double.parse(textEditingControllerAmount.text),
          widget.quantity,
          Category().mapcategorytonum[categorySelected]);
    });

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
                  widget.headline,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: textEditingControllerName,
                  decoration: InputDecoration(
                    labelText: "name",
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
                  controller: textEditingControllerAmount,
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
                DropDown(
                  setcategoryaddress: noUseFunction,
                ),
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
                  child: (_futureAlbum == null)
                      ? FlatButton(
                          onPressed: () {
                            sendAllDataForUpdation();
                            // Navigator.of(context).pop();
                          },
                          child: Text(
                            widget.text,
                            style: TextStyle(fontSize: 18),
                          ))
                      : buildFutureBuilder(context),
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

  FutureBuilder<UpdateItemModel> buildFutureBuilder(contextw) {
    return FutureBuilder<UpdateItemModel>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("item added successfully");
        } else if (snapshot.hasError) {
          // return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
  }
}
