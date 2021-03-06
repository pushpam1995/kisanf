import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:kisan_dost_app/Model/storepayload.dart';
import 'package:kisan_dost_app/getcategoryresponsecustomer/customerresponsemodel.dart';
import 'package:kisan_dost_app/getcategoryresponsecustomer/customerresponseservice.dart';
import 'package:kisan_dost_app/getcategoryresponsefarmer/farmercategoryresponsemodel.dart';
import 'package:kisan_dost_app/getcategoryresponsefarmer/farmercategoryresponseservices.dart';
import 'package:kisan_dost_app/getcategoryresponseshop/shopcategorymodel.dart';
import 'package:kisan_dost_app/getcategoryresponseshop/shopcategoryservices.dart';
import 'package:kisan_dost_app/kisan_screens/otp_screen.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/userprofile.dart';
import 'package:kisan_dost_app/kisan_screens_shop/list_of_item_shop.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ItemListInsideFarmerScreen.dart';
import 'listitem/transaction.dart';
import 'myCartDesign.dart';
import 'myorderdesign.dart';

class FarmerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FarmerScreenDesign();
  }
}

class FarmerScreenDesign extends StatefulWidget {
  @override
  _FarmerScreenDesignState createState() => _FarmerScreenDesignState();
}

class _FarmerScreenDesignState extends State<FarmerScreenDesign> {
  int purchaseButton = 0;
  int saleButton = 0;
  int shopButton = 0;
  Color color1 = Colors.pink;
  Color color2 = Colors.grey;
  Color color3 = Colors.grey;
  Future<FarmerCategoryResponseModel>? _futureAlbum;
  Future<CustomerCategoryModel>? _futureAlbumCustomer;
  Future<ShopCategoryModel>? _futureAlbumShop;
   SharedPreferences? UserData;
  void farmerCategoryLoding() {
    setState(() {
      _futureAlbum = fetchfarmercategory();
    });
  }

  void customerCategoryLoding() {
    setState(() {
      _futureAlbumCustomer = fetchcustomercategory();
    });
  }

  void shopCategoryLoding() {
    setState(() {
      _futureAlbumShop = fetchShopCategory();
    });
  }

  void logOut() async{

    UserData = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    farmerCategoryLoding();
    customerCategoryLoding();
    shopCategoryLoding();
    logOut();
  }

  void purchaseIitemList(index) {
    final information = SharedPreferences.getInstance();
    information.then((value) {
      value.setInt("purchasecategorybuttonindex", index);
    });
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return ItemListInsidePurchase();
    }));
  }

  void saleItemList(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return MyApplist(
            AppBarName: "Sale Item List",
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar = AppBar(
      title: Text("Farmer Home"),

automaticallyImplyLeading: false,      /*   leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),*/
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {

            UserData!.clear();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
              return OtpVerify(context);

            }));
        //    Navigator.pop(context);
          },
          icon: Icon(Icons.logout),
        ),
      ],
    );
    double height = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.3,
              child: SizedBox(
                  height: height * 0.3,
                  width: double.infinity,
                  child: Carousel(
                    boxFit: BoxFit.fill,
                    images: [
                      /*  NetworkImage(
                            'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                        NetworkImage(
                            'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),*/
                      // ExactAssetImage("assets/images/LaunchImage.jpg")
                      ExactAssetImage("images/webslider1.png"),
                      ExactAssetImage("images/webslider2.png"),
                      ExactAssetImage("images/webslider3.png"),
                      ExactAssetImage("images/webslider4.png"),
                      ExactAssetImage("images/webslider5.png"),
                      ExactAssetImage("images/webslider6.png"),

                      // ExactAssetImage("images/mapp.png"),
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.lightGreenAccent,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.purple.withOpacity(0.5),
                    borderRadius: true,
                    moveIndicatorFromBottom: 180.0,
                    noRadiusForIndicator: true,
                  )),
            ),
            Container(
              height: height * 0.1,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.4,
                    color: color1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed: () {
                      setState(() {
                        saleButton = 1;
                        shopButton = 1;
                        purchaseButton = 0;
                        color1 = Colors.pink;
                        color2 = Colors.grey;
                        color3 = Colors.grey;
                      });
                    },
                    child: Text(
                      "Purchase",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.4,
                    color: color2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed: () {
                      setState(() {
                        shopButton = 1;
                        saleButton = 0;
                        purchaseButton = 1;
                        color1 = Colors.grey;
                        color2 = Colors.pink;
                        color3 = Colors.grey;
                      });
                    },
                    child: Text(
                      "Sale",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            (purchaseButton == 0)
                ? Container(
                    height: height * 0.45,
                    child: buildFutureBuilder(context),
                  )
                : (saleButton == 0)
                    ? Container(
                        height: height * 0.45,
                        child: buildFutureBuilderCustomer(context),
                      )
                    : /*(shopButton==0)?Container(
                height: height * 0.49,
                child:buildFutureBuilderShop(context),*/
                    Container(
                        child: Center(
                          child: Text("some proble in button logic..."),
                        ),
                      )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'My Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'My Cart',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MyCartPage();
      }));
    }

    if (index == 1) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return ProfileUI2();
      }));
    }
    if (index == 2) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MyCartPage();
      }));
    }
  }

  FutureBuilder<FarmerCategoryResponseModel> buildFutureBuilder(contextw) {
    return FutureBuilder<FarmerCategoryResponseModel>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.payload.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => purchaseIitemList(
                    snapshot.data!.payload.elementAt(index).categoryId),
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Center(
                    child: Text(
                      snapshot.data!.payload.elementAt(index).name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  height: 45.0,
                  width: MediaQuery.of(context).size.width - 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.blue,
                      image: DecorationImage(
                          image: new NetworkImage("put your image here"),
                          fit: BoxFit.fill)),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }

  FutureBuilder<CustomerCategoryModel> buildFutureBuilderCustomer(contextw) {
    return FutureBuilder<CustomerCategoryModel>(
      future: _futureAlbumCustomer,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.payload.length,
            itemBuilder: (contextr, index) {
              return GestureDetector(
                onTap: () => saleItemList(context),
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Center(
                    child: Text(
                      snapshot.data!.payload.elementAt(index).name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  height: 45.0,
                  width: MediaQuery.of(context).size.width - 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.blue,
                      image: DecorationImage(
                          image: new NetworkImage("put your image link here"),
                          fit: BoxFit.fill)),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }

/*FutureBuilder<ShopCategoryModel> buildFutureBuilderShop(contextw) {
  return FutureBuilder<ShopCategoryModel>(
    future: _futureAlbumShop,
    builder: (context, snapshot) {
      if (snapshot.hasData) {

        return ListView.builder(
          itemCount: snapshot.data!.payload.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Center(
                child: Text(
                  snapshot.data!.payload.elementAt(index).name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              height: 45.0,
              width: MediaQuery.of(context).size.width - 100.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.blue,
                  image: DecorationImage(
                      image: new NetworkImage(
                          "put your image link"),
                      fit: BoxFit.fill)),
            );
          },
        );
      } else if (snapshot.hasError) {
        return Center(child: Text('${snapshot.error}'));
      }

      return Center(child: CircularProgressIndicator());
    },
  );
}*/

  int _selectedIndex = 0;
}
