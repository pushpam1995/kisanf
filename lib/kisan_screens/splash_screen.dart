import 'package:flutter/material.dart';
import 'package:kisan_dost_app/kisan_screens_customer/main.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/main.dart';
import 'package:kisan_dost_app/kisan_screens_shop/main123.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'otp_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;
  //UserDetails payload;
  // SharedPreferences Userdata;
  String? SHOP, FARMER, CUSTOMER;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),

    );
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, getUserInfo);
  }

  void getUserInfo() async {
    final SharedPreferences UserData = await SharedPreferences.getInstance();
    final name = UserData.getString("name") ?? 0;
    final email = UserData.getString("email") ?? 0;
    final phone = UserData.getString("phoneNumber") ?? 0;
    final userType = UserData.getString("userType") ?? 0;
    if (name == 0) {
      print("not a user");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OtpVerify(context)));
    } else {
      print('user is there');

      if (userType == "FARMER") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FarmerScreen()));
      }
      if (userType == "CUSTOMER") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CustomerScreen()));
      }
      if (userType == "SHOP") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FarmerShop()));
      }
    }
  }

  /* Future<UserDetails> getUserInfo() async {
    print('getting user type');
    final SharedPreferences Userdata = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap;
    final String payloadStr = Userdata.getString('payload');
    if (payloadStr != null) {
      userMap = jsonDecode(payloadStr) as Map<String, dynamic>;
      print(payload);
      return payload;
    }
    if (payload == null) {
      print('new user type');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpVerify()));
    } else if (payload.userType == SHOP) {
      print('user is shoptype');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ShopDashboard()));
    } else if (payload.userType == FARMER) {
      print('user is farmer');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FarmerDashboard()));
    } else if (payload.userType == CUSTOMER) {
      print('user is customer');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CustomerDashboard()));
    }
  } */

  initScreen(BuildContext context) {
    AssetImage assetImage = AssetImage("images/logoformer.png");
    Image image = Image(
      image: assetImage,
      height: 200.0,
      width: 250.0,
    );

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 40.0)),
            Text(
              "WELCOME TO",
              style: TextStyle(fontSize: 30.0, color: Colors.green),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'images/Kisanlogoname.png',
                  width: animation.value * 300,
                  height: animation.value * 300,
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 20.0)), // padding top for button
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        )
      ],
    );
  }
}
