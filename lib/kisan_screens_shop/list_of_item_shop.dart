import 'package:flutter/material.dart';
import 'package:kisan_dost_app/getcategoryitem/getcategoryitemservice.dart';
import 'package:kisan_dost_app/kisan_screens_shop/drop_down.dart';
import 'package:kisan_dost_app/kisan_screens_shop/popup_fragment.dart';
import 'package:kisan_dost_app/kisan_screens_shop/transaction.dart';
import 'package:kisan_dost_app/postshopitemandgettheresponse/postshopitemmodel.dart';
import 'package:kisan_dost_app/postshopitemandgettheresponse/postshopitemservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'additempopup.dart';
import 'coustom_ltem_item.dart';
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
  int cat = 0;

  List<Transaction> transaction = [];

  void addNewItem(Transaction trns) {
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

  void handleClick(value, index, itemid, shopId, categoryId, quantity, category,
      details, name, price) {
    if (value == "Edit")
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialogBox(
              headline: "Edit Item Details",
              descriptions: "This item will be Reflect on your item",
              text: "Post",
              itemId: itemid,
              shopId
              :shopId,
              categoryId
              :categoryId,
              quantity
              :quantity,
              category
              :category,
              details
              :details,
              name
              :name,
              price
              :price,


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
  void initState() {
    // TODO: implement initState
    super.initState();
    final pref = SharedPreferences.getInstance();
    pref.then((value) {
      cat = value.getInt("SHOPCATEGORY");
      cat = 1;
      fetchcategoryitem(cat.toString()).then((value) {
        print("cat value pass by the function : $cat");
        print("payload should be not null : ${value.payload.length}");
        value.payload.forEach((element) {
          //  Transaction(category: element.categoryId.toString(),title: element.name,price:500);

          // if(cat!=0 && element.categoryId==cat) {
          setState(() {
            transaction.add(Transaction(
                category: element.description.toString(),
                title: element.name,
                price: element.unitPrice,
                quantity: element.quantity,
                categoryId: element.categoryId,
                description: element.description,
                itemId: element.itemId,
                shopId: element.shopId));
          });
          //  }
        });
      });
    });
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
          return (cat != 0) && (transaction.length != 0)
              ? Card(
            shadowColor: Colors.lightGreenAccent,
            child: CustomListItem(
              popup: handleClick,
              index: index,
              title: transaction[index].title,
              price: transaction[index].price,
              category: transaction[index].category,
              quantity: transaction[index].quantity,
              categoryId: transaction[index].categoryId,
              description: transaction[index].description,
              itemId: transaction[index].itemId,
              shopId: transaction[index].shopId,
              thumbnail: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: new NetworkImage(
                            "https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/MDA2018_inline_03.jpg"),
                        fit: BoxFit.fill)),
              ),
            ),
          )
              : (cat != 0) && (transaction.length == 0)
              ? Center(
            child: Text(
              "No Data Available under this category.",
              style: TextStyle(color: Colors.yellow, fontSize: 30),
            ),
          )
              : CircularProgressIndicator();
        },
        itemCount: (transaction.length != 0) ? transaction.length : 1,
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
                  addItem: addNewItem,
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
