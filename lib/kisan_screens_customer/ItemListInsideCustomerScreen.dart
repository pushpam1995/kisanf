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
    final PreferredSizeWidget appBar=AppBar(
      leading: IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {},
      ),
      title: Text("Buy Item"),
      centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
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

            Container(
              height: MediaQuery.of(context).size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top,
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
