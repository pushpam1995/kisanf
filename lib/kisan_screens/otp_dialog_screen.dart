import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kisan_dost_app/kisan_screens/signup_screen.dart';
import 'package:kisan_dost_app/kisan_screens_customer/main.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/main.dart';
import 'package:kisan_dost_app/kisan_screens_shop/main123.dart';
import 'package:kisan_dost_app/kisan_services/user_service.dart';
import 'package:kisan_dost_app/verifyotp/otpveryfymodel.dart';
import 'package:kisan_dost_app/verifyotp/otpveryfysevices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpDialog extends StatefulWidget {
  final String userPhoneNumber;
  final String userDeviceId;

  OtpDialog(this.userPhoneNumber, this.userDeviceId);

  @override
  _OtpDialogState createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  TextEditingController otpController = TextEditingController();
  UserService otpService = new UserService();
  Future<OtpVerify>? _futureAlbum;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10.0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: screenHeight * 0.4,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.green, offset: Offset(10, 10), blurRadius: 10),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            TextFormField(
              style: TextStyle(fontSize: 20.0, color: Colors.orange),
              maxLines: 1,
              keyboardType: TextInputType.phone,
              controller: otpController,
              maxLength: 4,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp(r"[0-9]"))
              ],
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.lightGreen, width: 2.0),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20),
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.perm_phone_msg_sharp,
                    size: 30.0,
                    color: Colors.green,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: " Enter OTP here",
                  fillColor: Colors.white),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Align(
              alignment: Alignment.bottomCenter,
              child: (_futureAlbum == null)
                  ? RaisedButton(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.lightGreen,
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        setState(() {
                          _futureAlbum = verifyOtp(
                              otpController.text, widget.userPhoneNumber);
                        });
                      },
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : i == 0
                      ? buildFutureBuilder(context)
                      : Container(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: RaisedButton(
                colorBrightness: Brightness.dark,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                child: Text(
                  'RESEND OTP',
                  style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<OtpVerify> buildFutureBuilder(contextpop) {
    return FutureBuilder<OtpVerify>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          i = i + 2;
          if (snapshot.data!.payload != null) {

              final information = SharedPreferences.getInstance();
              information.then((value) {
                value.setString("name", snapshot.data!.payload!.name);
                value.setString("email", snapshot.data!.payload!.email);
                value.setString(
                    "phoneNumber", snapshot.data!.payload!.phoneNumber);
                value.setString("userType",    snapshot.data!.payload!.userType);
                value.setInt("userId", snapshot.data!.payload!.userId);
              });


            if (snapshot.data!.payload!.userType == "FARMER") {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FarmerScreen()));
              });
            }
            if (snapshot.data!.payload!.userType == "CUSTOMER") {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomerScreen()));
              });
            }
            if (snapshot.data!.payload!.userType == "SHOP") {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FarmerShop()));
              });
            }
          } else {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignUpScreen(
                            phoneNumber: widget.userPhoneNumber,
                            deviceId: widget.userDeviceId,
                          )));
            });
          }
          Navigator.pop(contextpop);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
  }
}
