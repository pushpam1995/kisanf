import 'package:flutter/material.dart';
import 'package:kisan_dost_app/getcategoryitem/getcategoryitemmodel.dart';
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
        setState(() {
         // cat= value.getInt("purchasecategorybuttonindex");
          cat=1;
        });
        fetchcategoryitem(cat.toString()).then((value) {
          print("cat value pass by the function : $cat");
          print("payload should be not null : ${value.payload.length}");
          value.payload.forEach((element) {
            //  Transaction(category: element.categoryId.toString(),title: element.name,price:500);


            // if(cat!=0 && element.categoryId==cat) {
            setState(() {
              transaction.add(Transaction(category: element.description.toString(),
                  title: element.name,
                  price: element.unitPrice,qunatity: element.quantity));
            });
            //  }

          });

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
          return (cat!=0) && (transaction.length!=0)?
          Card(
            shadowColor: Colors.lightGreenAccent,
            child: CustomListItem(
              index: index,
              title: transaction[index].title,
              price: transaction[index].price,
              category: transaction[index].category,
              quantity: transaction[index].qunatity,
              thumbnail: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: new NetworkImage(
                            "https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/MDA2018_inline_03.jpg"),
                        fit: BoxFit.fill)),
              ),
            ),
          ):(cat!=0) && (transaction.length==0)?Center(child: Text("No Data Available under this category.",style: TextStyle(color: Colors.yellow,fontSize: 30),),):CircularProgressIndicator();
        },
        itemCount: (transaction.length!=0)?transaction.length:1,
      ),
    );
  }


}
