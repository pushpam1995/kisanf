import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisan_dost_app/postshopitemandgettheresponse/postshopitemmodel.dart';
import 'package:kisan_dost_app/postshopitemandgettheresponse/postshopitemservice.dart';

import 'constants.dart';
import 'drop_down.dart';
import 'list_category.dart';

class CustomDialogBoxForAddingItem extends StatefulWidget {
  final String title, descriptions, text;



  const CustomDialogBoxForAddingItem(
      { required this.title, required this.descriptions, required this.text});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBoxForAddingItem> {
  String a="";
  void setCategorySelection(value){
    a=value;
  }
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
  late var shopId;
  late var price;
  late var quantity;

  Future<PostShopItemModel>? _futureAlbum;
  //_futureAlbum=null;
  void postItemOnServer(String name,String description, shopid, price, quantity, category){
    _futureAlbum=null;
    setState(() {
      _futureAlbum=postItemDetails(name,description,shopid,price,quantity,category);
    });

  }





  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
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
                  SizedBox(
                    height: 15,
                  ),
                  new DropDown(setcategoryaddress: setCategorySelection),
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
                  (_futureAlbum==null)? Align(
                    alignment: Alignment.bottomRight,
                    child: FlatButton(
                        onPressed: () {
                          name=textEditingControllerName.text;
                          descripton=textEditingControllerDescription.text;
                          shopId=(textEditingControllerShopId.text);
                          price=(textEditingControllerPrice.text);
                          quantity=(textEditingControllerQuantity.text);
                          var category=Category().mapcategorytonum[a];

                          postItemOnServer(name,descripton,shopId,price,quantity,category!);

                          // print("$name, $descripton, $shopId, $price, $price, $quantity, $a, $va");
                          //Navigator.of(context).pop();
                        },
                        child: Text(
                          widget.text,
                          style: TextStyle(fontSize: 18),
                        )),
                  ):buildFutureBuilder(context),
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
      ),
    );
  }



  FutureBuilder<PostShopItemModel> buildFutureBuilder(contextw) {
    return FutureBuilder<PostShopItemModel>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        print("${snapshot.data}");
        if (snapshot.hasData) {
        /*  WidgetsBinding.instance!.addPostFrameCallback((_) {
            setState(() {
              _futureAlbum = null;
            });
          });*/
          textEditingControllerQuantity.clear();
          textEditingControllerPrice.clear();
          textEditingControllerShopId.clear();
          textEditingControllerDescription.clear();
          textEditingControllerName.clear();
          return Text("item added successfully");
          //Navigator.pop(contextw);
        } else if (snapshot.hasError) {
          print("inside  else if (snapshot.hasError)");
           return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
    setState(() {
      _futureAlbum=null;
    });
  }

}
