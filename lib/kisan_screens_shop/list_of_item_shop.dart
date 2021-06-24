import 'package:flutter/material.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/listitem/transaction.dart';
import 'package:kisan_dost_app/kisan_screens_shop/popup_fragment.dart';

import 'coustom_ltem_item.dart';
import 'inputfieldpage.dart';

/// This is the main application widget.
class MyApplist extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApplist> {
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
        title: const Text("Shop Item"),
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

      /*ListView(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 170.0,
        children: <CustomListItem>[
          CustomListItem(
            category: 'Flutter',
            price: 999000,
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            title: 'The Flutter',
          ),
          CustomListItem(
            category: 'Dash',
            price: 884000,
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.yellow),
            ),
            title: 'Announcing',
          ),
        ],
      ),*/

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
          showModalBottomSheet(
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
          );
        },
      ),
    );
  }
}
