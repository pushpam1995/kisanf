import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:kisan_dost_app/getcategoryresponseshop/shopcategorymodel.dart';
import 'package:kisan_dost_app/getcategoryresponseshop/shopcategoryservices.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/myCartDesign.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/userprofile.dart';
import 'package:kisan_dost_app/kisan_screens_shop/list_of_item_shop.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FarmerShop extends StatefulWidget {
  @override
  _FarmerShopState createState() => _FarmerShopState();
}

class _FarmerShopState extends State<FarmerShop> {
  int _selectedIndex = 0;
  Future<ShopCategoryModel>? _futureAlbumShop;

  void _shopItem(context,categoryId) {
    final pref=SharedPreferences.getInstance();
    pref.then((value){
      value.setInt("SHOPCATEGORY", categoryId);
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return MyApplist(AppBarName: "Shop Item");
        },
      ),
    );
  }

  void shopCategoryLoding() {
    setState(() {
      _futureAlbumShop = fetchShopCategory();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    shopCategoryLoding();
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar = AppBar(
      title: Text("Shop Home"),
      automaticallyImplyLeading: false,
      /*   leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),*/
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.logout),
        ),
      ],
    );
    double height = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom);
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
                      /*   NetworkImage(
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
              height: MediaQuery.of(context).size.height*0.5,
              child: buildFutureBuilderShop(context),
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
          /*  BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'My Cart',
          ),*/
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
    /* if(index==2){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return MyCartPage();
      }));
    }*/
  }

  FutureBuilder<ShopCategoryModel> buildFutureBuilderShop(contextw) {
    return FutureBuilder<ShopCategoryModel>(
      future: _futureAlbumShop,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.payload.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _shopItem(context,snapshot.data!.payload.elementAt(index).categoryId),
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
                          image: new NetworkImage("put your image link"),
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
}
