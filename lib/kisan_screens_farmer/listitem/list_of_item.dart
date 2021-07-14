import 'package:flutter/material.dart';
import 'package:kisan_dost_app/getcategoryitem/getcategoryitemservice.dart';
import 'package:kisan_dost_app/getcategoryresponsefarmer/farmercategoryresponseservices.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/listitem/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'coustom_ltem_item.dart';

/// This is the main application widget.
class MyApp extends StatefulWidget {

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {

int cat=0;
  List<Transaction> transaction = [];


  addNewItem(Transaction trns) {
    setState(() {
      transaction.add(trns);
    });
  }

  void categorySelect(value) {
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final information = SharedPreferences.getInstance();
    information.then((value){

        cat= value.getInt("purchasecategorybuttonindex");


    });
    fetchfarmercategory().then((value) {
      value.payload.forEach((element) {
      //  Transaction(category: element.categoryId.toString(),title: element.name,price:500);


       // if(cat!=0 && element.categoryId==cat) {
          setState(() {
            transaction.add(Transaction(category: element.categoryId.toString(),
                title: element.name,
                price: 500));
          });
      //  }

      });

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 220.0,
        itemBuilder: (ctx, index) {
          print("index value while before adding item: " + index.toString());
          return Card(
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
          );
        },
        itemCount: transaction.length,
      ),
    );
  }
}
