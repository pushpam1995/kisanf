import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'dart:ui';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kisan_dost_app/getotpresponse/getotpresponsemodel.dart';
import 'package:kisan_dost_app/getotpresponse/getotpresponseservice.dart';
import 'package:kisan_dost_app/kisan_screens_customer/main.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/main.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/userprofile.dart';
import 'package:kisan_dost_app/kisan_screens_shop/main123.dart';

import 'otp_dialog_screen.dart';

class OtpVerify extends StatefulWidget {
  BuildContext con;
  OtpVerify(this.con);

  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  TextEditingController phnumberController = TextEditingController();
  Future<GetOtpModel>? _futureAlbum;
  late String deviceId;
  int i = 0;
  //String phnumber, phoneNumber;
  //OtpModel userDetails = new OtpModel();
  // UserService otpService = new UserService();

  Future<String> getId() async {
    // var deviceInfo = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var androidDeviceInfo = await deviceInfo.androidInfo;
        deviceId = androidDeviceInfo.androidId;
      } else if (Platform.isIOS) {
        var iosDeviceInfo = await deviceInfo.iosInfo;
        deviceId = iosDeviceInfo.identifierForVendor;
      }
    } on PlatformException {
      print('failed');
    }
    return deviceId;
  }

  var otpGenerationResponse;
  void func() {
    /*Navigator.push(
        context, MaterialPageRoute(builder: (context) => CustomerScreen()));*/
    /*  Navigator.push(
       context, MaterialPageRoute(builder: (context) => FarmerScreen()));*/
    /*Navigator.push(
        context, MaterialPageRoute(builder: (context) => FarmerShop()));*/
    setState(() {
      i = 0;
      _futureAlbum = null;
      _futureAlbum = createOtp(phnumberController.text, deviceId);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
    i = 0;
    print("initState");
  }

  /*
    This method is called immediately after initState on the first time the widget is built.
    */
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
    setState(() {
      _futureAlbum = null;
      i = 2;
    });
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactive");
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text('Kisan Dosth',
              style: TextStyle(fontSize: 20.0, color: Colors.white))),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: screenHeight * 0.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset("images/otpicon.png"),
                  ],
                ),
              ),
            ),
            Center(
                child: Text(
              "Verifing Phone Number",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 5.0, bottom: 5.0, left: 8.0, right: 8.0),
              child: TextField(
                style: TextStyle(fontSize: 20.0, color: Colors.orange),
                maxLines: 1,
                keyboardType: TextInputType.number,
                controller: phnumberController,
                maxLength: 10,
                inputFormatters: [
                  WhitelistingTextInputFormatter(RegExp(r"[0-9]"))
                ],
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.lightGreen, width: 2.0),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20),
                      ),
                    ),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.phone_iphone,
                      size: 30.0,
                      color: Colors.green,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: " Enter Your Phone Number",
                    fillColor: Colors.white),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            (_futureAlbum == null)
                ? RaisedButton(
                    padding: const EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      " Get OTP",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    elevation: 7.0,
                    color: Colors.lightGreen,
                    onPressed: func,
                  )
                : i == 0
                    ? buildFutureBuilder(context)
                    : Container(),
          ],
        ),
      ),
    );
  }

  FutureBuilder<GetOtpModel> buildFutureBuilder(contextw) {
    return FutureBuilder<GetOtpModel>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          i = i + 1;
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Center(
                    child: OtpDialog(phnumberController.text.toString(),
                        deviceId.toString()),
                  );
                });
          });
          //  Navigator.pop(contextw);
          // Navigator.pop(widget.con);

        } else if (snapshot.hasError) {
          // return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
  }
}
