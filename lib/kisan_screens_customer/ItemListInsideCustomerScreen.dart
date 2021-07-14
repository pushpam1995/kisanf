import 'package:flutter/material.dart';

import 'HorizontalItemScroll.dart';
import 'ItemModel.dart';
import 'listitem/list_of_item.dart';

class ItemListInsideCustomerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ItemListInsideCustomerScreenDesign();

  }
}

class ItemListInsideCustomerScreenDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),
        title: Text("Buy Item"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraint) {
                  return Container(
                      height: constraint.maxHeight * 0.07,
                      child: HorizontalItemScroll());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ConstrainedBox(
                // width: double.infinity,
                //height: 80,
                // padding: EdgeInsets.all(10.0),
                constraints:
                    BoxConstraints.tightFor(width: double.infinity, height: 50),
                child: Center(
                  child: TextField(
                    maxLength: 25,
                    //   maxLengthEnforced: true,
                    textAlign: TextAlign.center,
                    autocorrect: true,
                    decoration: InputDecoration(
                      //  hintText: 'Type Text Here...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Colors.grey, prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 188,
              child: MyApp(),
            ),
          ],
        ),
      ),
    );
  }

  List wonders = [
    CustomerItemLIst(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Taj-Mahal.jpg",
        name: "Taj Mahal",
        country: "India"),
    CustomerItemLIst(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Christ-the-Redeemer.jpg",
        name: "Christ the Redeemer",
        country: "Brazil"),
    CustomerItemLIst(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2016/03/petra-jordan9.jpg",
        name: "Petra",
        country: "Jordan"),
    CustomerItemLIst(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Great-Wall-of-China-view.jpg",
        name: "The Great Wall of China",
        country: "China"),
    CustomerItemLIst(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/View-of-the-Colosseum.jpg",
        name: "The Colosseum",
        country: "Rome"),
    CustomerItemLIst(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Machu-Picchu-around-sunset.jpg",
        name: "Machu Picchu",
        country: "Peru"),
    CustomerItemLIst(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Chichen-Itza-at-night.jpg",
        name: "Chichén Itzá",
        country: "Mexico"),
  ];
}
