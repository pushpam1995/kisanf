import 'package:flutter/material.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/listitem/transaction.dart';


import 'coustom_ltem_item.dart';
import 'onclickoflistitemcustomerscreen.dart';

/// This is the main application widget.
class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List<Transaction> transaction = [
    Transaction(category: 'Fruits', price: 500, title: "java plum"),
    Transaction(category: 'Vegetables', price: 200, title: "Cauliflower."),
    Transaction(category: 'Nuts', price: 1500, title: "TPistachios"),
    Transaction(category: 'Nuts', price: 2000, title: "Marcona Almonds."),
    Transaction(category: 'Vegetables', price: 100, title: "green pepper"),
    Transaction(category: 'Fruits', price: 600, title: "Indian gooseberry"),
  ];

  addNewItem(Transaction trns) {
    setState(() {
      transaction.add(trns);
    });
  }

  void categorySelect(value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 220.0,
        itemBuilder: (ctx, index) {
          print("index value while before adding item: " + index.toString());
          return GestureDetector(onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OnClickOfListItemCustomerScreen()));
          },
            child: Card(
              shadowColor: Colors.lightGreenAccent,
              child: CustomListItem(
                index: index,
                title: transaction[index].title,
                price: transaction[index].price,
                category: transaction[index].category,
                thumbnail: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: new NetworkImage(
                              "https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/MDA2018_inline_03.jpg"),
                          fit: BoxFit.fill)),
                ),
              ),
            ),
          );
        },
        itemCount: transaction.length,
      ),
    );
  }
}
