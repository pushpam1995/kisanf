import 'package:flutter/material.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/listitem/transaction.dart';
import 'package:kisan_dost_app/kisan_screens_shop/drop_down.dart';
import 'package:kisan_dost_app/kisan_screens_shop/popup_fragment.dart';
import 'package:kisan_dost_app/postshopitemandgettheresponse/postshopitemmodel.dart';
import 'package:kisan_dost_app/postshopitemandgettheresponse/postshopitemservice.dart';

import 'additempopup.dart';
import 'coustom_ltem_item.dart';
import 'inputfieldpage.dart';
import 'list_category.dart';

/// This is the main application widget.
class MyApplist extends StatefulWidget {
  String AppBarName;

  MyApplist({required this.AppBarName});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApplist> {
  TextEditingController textEditingControllerName = new TextEditingController();
  TextEditingController textEditingControllerDescription =
      new TextEditingController();
  TextEditingController textEditingControllerShopId =
      new TextEditingController();
  TextEditingController textEditingControllerPrice =
      new TextEditingController();
  TextEditingController textEditingControllerQuantity =
      new TextEditingController();
  late String name;
  late String descripton;
  late String shopId;
  late String price;
  late String quantity;
  String dropdownValue = 'Category one';
  final _formKey = GlobalKey();


  List<Transaction> transaction = [
    Transaction(category: 'Rice', price: 999000, title: "The Food"),
    Transaction(category: 'Rice', price: 999000, title: "The Food"),
    Transaction(category: 'Rice', price: 999000, title: "The Food"),
    Transaction(category: 'Rice', price: 999000, title: "The Food"),
    Transaction(category: 'Rice', price: 999000, title: "The Food"),
    Transaction(category: 'Rice', price: 999000, title: "The Food"),
  ];

  addNewItem(Transaction trns) {
    setState(() {
      transaction.add(trns);
    });
  }
  String a = "Choose Category";
  void changeCat(value) {
    setState(() {
      a = value;
    });
  }


  void handleClick(value, index) {
    if (value == "Edit")
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              title: "Edit Item Details",
              descriptions: "This item will be Reflect on your item",
              text: "Post",
            );
          });
    if (value == "Delete") {
      setState(() {
        transaction.removeAt(index);
      });
    }
  }

  void categorySelect(value) {
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.AppBarName),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 220.0,
        itemBuilder: (ctx, index) {
          print("index value while before adding item: " + index.toString());
          return Card(
            shadowColor: Colors.lightGreenAccent,
            child: CustomListItem(
              popup: handleClick,
              index: index,
              title: transaction[index].title,
              price: transaction[index].price,
              category: transaction[index].category,
              thumbnail: Container(
                decoration: const BoxDecoration(color: Colors.blue),
              ),
            ),
          );
        },
        itemCount: transaction.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // splashColor: Colors.purple,
        elevation: 5.0,
        // hoverColor: Colors.purple,
        // backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          // color: Colors.white,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialogBoxForAddingItem(
                  title: "Add Item Details",
                  descriptions: "This item will be Reflect on your item List",
                  text: "Add Item",
                );
              });
         /* showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Stack(
                   // overflow: Overflow.visible,
                    children: <Widget>[
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Name of an item"),
                                controller: textEditingControllerName,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "description of an item"),
                                controller: textEditingControllerDescription,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration:
                                    InputDecoration(hintText: "Shop id"),
                                controller: textEditingControllerShopId,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration:
                                    InputDecoration(hintText: "price per kg"),
                                controller: textEditingControllerPrice,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Quantity Available"),
                                controller: textEditingControllerQuantity,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child:DropdownButton<String>(
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                child: Text("Submitß"),
                                onPressed: () {
                                 name=textEditingControllerName.text;
                                 descripton=textEditingControllerDescription.text;
                                 shopId=textEditingControllerShopId.text;
                                 price=textEditingControllerPrice.text;
                                 quantity=textEditingControllerQuantity.text;
                                 int? va=Category().mapcategorytonum[a];



                                 print("$name, $descripton, $shopId, $price, $price, $quantity, $va");

                                  Navigator.pop(context);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });*/
          /*  showModalBottomSheet(
            context: context,
            builder: (_) {
              return SingleChildScrollView(
                child: GestureDetector(
                  child: InputFieldPage(
                    addNewItem,
                  ),
                ),
              );
            },
          );*/
        },
      ),
    );
  }




}
