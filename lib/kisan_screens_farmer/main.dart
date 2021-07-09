import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/userprofile.dart';
import 'package:kisan_dost_app/kisan_screens_shop/list_of_item_shop.dart';

import 'ItemListInsideCustomerScreen.dart';
import 'myCartDesign.dart';
import 'myorderdesign.dart';

class FarmerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FarmerScreenDesign(),
    );
  }
}

class FarmerScreenDesign extends StatefulWidget {
  @override
  _FarmerScreenDesignState createState() => _FarmerScreenDesignState();
}

class _FarmerScreenDesignState extends State<FarmerScreenDesign> {
int purchaseButton=0;
int saleButton=0;
Color color1 = Colors.pink;
Color color2 = Colors.grey;

 void purchaseIitemList(){
   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
     return ItemListInsidePurchase();
   }));
  }

void saleItemList(context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) {
        return MyApplist(AppBarName: "Sale Item List",);
      },
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar = AppBar(
      title: Text("Customer Page..."),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return ItemListInsidePurchase();
            }));
          },
          icon: Icon(Icons.logout),
        ),
      ],
    );
    double height = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    return MaterialApp(home:
       Scaffold(
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
                      images: [
                        NetworkImage(
                            'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                        NetworkImage(
                            'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                        // ExactAssetImage("assets/images/LaunchImage.jpg")
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(minWidth: MediaQuery.of(context).size.width*0.4,
                      color: color1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      onPressed: () {
                      setState(() {
                        purchaseButton=0;
                        color1=Colors.pink;
                        color2=Colors.grey;
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
                    MaterialButton(minWidth: MediaQuery.of(context).size.width*0.4,
                      color: color2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      onPressed: () {
                        setState(() {
                          purchaseButton=1;
                          color1=Colors.grey;
                          color2=Colors.pink;
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
              (purchaseButton==0)?Container(
                height: height * 0.49,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: purchaseIitemList,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Center(
                          child: Text(
                            'Purchase Item Button $index',
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
                                    "https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/MDA2018_inline_03.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    );
                  },
                ),
              ):Container(
                height: height * 0.49,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (contextr, index) {
                    return GestureDetector(
                      onTap:()=> saleItemList(context),
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Center(
                          child: Text(
                            'Sale Item Button $index',
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
                                    "https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/MDA2018_inline_03.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    );
                  },
                ),
              ),
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
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if(index==0){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MyOrder();
      }));
    }

    if(index==1){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return ProfileUI2();
      }));
    }
    if(index==2){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MyCartPage();
      }));
    }
  }


  int _selectedIndex = 0;
}
