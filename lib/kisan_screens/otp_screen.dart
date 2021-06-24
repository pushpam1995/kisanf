import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'dart:ui';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'otp_dialog_screen.dart';

class OtpVerify extends StatefulWidget {


  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  TextEditingController phnumberController = TextEditingController();

  late String deviceId;
  //String phnumber, phoneNumber;
  //OtpModel userDetails = new OtpModel();
  // UserService otpService = new UserService();

  @override
  void initState() {
    super.initState();
    getId();
    //String userDeviceId = await _getId();
  }

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
                height: screenHeight * 0.3,
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
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
              child: TextField(
                style: TextStyle(fontSize: 30.0),
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
                        const Radius.circular(30),
                      ),
                    ),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.phone_iphone,
                      size: 40.0,
                      color: Colors.green,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: " Enter Your Phone Number",
                    fillColor: Colors.white),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
                padding: const EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  " Get OTP",
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
                elevation: 7.0,
                color: Colors.lightGreen,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return OtpDialog(phnumberController.text.toString(),
                            deviceId.toString());
                      });



                  /*setState(() {
                    otpGenerationResponse = UserService()
                        .generateOtp(OtpVerModel(
                            userPhoneNumber: phnumberController.text.toString(),
                            userDeviceId: deviceId.toString()))
                        .then((value) {
                      if (value == "200") {
                        print('dialog is opening');
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return OtpDialog(
                                  phnumberController.text.toString(),
                                  deviceId.toString());
                            });
                      } else {
                        print('OTP generation failed dialog');
                      }
                    });
                  });*/
                }),
          ],
        ),
      ),
    );
  }
}
