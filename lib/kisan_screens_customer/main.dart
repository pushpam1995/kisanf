import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:kisan_dost_app/getcategoryresponsecustomer/customerresponsemodel.dart';
import 'package:kisan_dost_app/getcategoryresponsecustomer/customerresponseservice.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/userprofile.dart';

import 'ItemListInsideCustomerScreen.dart';
import 'checkoutScreenforbuyallitem.dart';

class CustomerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  CustomerScreenDesign();

  }
}

class CustomerScreenDesign extends StatefulWidget {
  @override
  _CustomerScreenDesignState createState() => _CustomerScreenDesignState();
}

class _CustomerScreenDesignState extends State<CustomerScreenDesign> {
  Future<CustomerCategoryModel>? _futureAlbum;
  void customerCategoryLoding() {
    setState(() {
      _futureAlbum = fetchcustomercategory();
    });
  }
 void customeritemforbuying(){
   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
     return ItemListInsideCustomerScreen();
   }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customerCategoryLoding();
  }
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar = AppBar(
      title: Text("Customer Home"),
     /* leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),*/
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.shopping_cart_outlined),
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
                  child: Carousel(boxFit: BoxFit.fill,
                    images: [
                    /*  NetworkImage(
                          'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                      NetworkImage(
                          'https://ibb.co/Kqg4NW6'),*/
                      ExactAssetImage("images/Kisanlogoname.png"),
                       ExactAssetImage("images/Kisanlogo75.png"),
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
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Catalogue",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text("Quality handpick"),
                ],
              ),
            ),
            (_futureAlbum != null)? Container(
              height: height * 0.45,
              child: buildFutureBuilder(context),
            ):Container(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
         /* BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'My Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
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
    if(index==0){
      setState(() {
        _selectedIndex = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return ProfileUI2();
        }));
      });
    }
    if(index==1){
      setState(() {
        _selectedIndex = index;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CheckOutScreenForBuyAllItem()),
        );
      });
    }

  }
  FutureBuilder<CustomerCategoryModel> buildFutureBuilder(contextw) {
    return FutureBuilder<CustomerCategoryModel>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {

          return ListView.builder(
            itemCount: snapshot.data!.payload.length,
            itemBuilder: (context, index) {
              return GestureDetector(onTap: customeritemforbuying,
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
                          image: new NetworkImage(
                              "put your image link"),
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

  int _selectedIndex = 0;
}
