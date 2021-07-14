import 'package:flutter/material.dart';
import 'package:kisan_dost_app/getregisteruserresponse/registerationmodel.dart';
import 'package:kisan_dost_app/getregisteruserresponse/registrationservices.dart';
import 'package:kisan_dost_app/kisan_screens_customer/main.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/main.dart';
import 'package:kisan_dost_app/kisan_screens_shop/main123.dart';
import 'package:kisan_dost_app/kisan_services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  final String phoneNumber;
  final String deviceId;

  SignUpScreen({
    required this.phoneNumber,
    required this.deviceId,
  });

  @override
  State<StatefulWidget> createState() => LunchState();
}

class LunchState extends State<SignUpScreen> {
  UserService otpService = new UserService();
  int i = 0;
  //String userType="Register as";
  // UserResponseModel userResponseModel = new UserResponseModel(message: '');
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Future<RegistrationModel>? _futureAlbum;

  TextEditingController usertypeController = TextEditingController();
  String userType = "Register as";
  String CheckUserType = "NAN";

  void changeCat(value) {
    setState(() {
      userType = value;
      CheckUserType = value;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
    setState(() {
      i = 3;
      _futureAlbum = null;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //  Navigator.pop(widget.contextpop);
  }

  void homeScreen() {
    setState(() {
      i = 0;
      _futureAlbum = null;
      _futureAlbum = registerUser(widget.phoneNumber, widget.deviceId,
          nameController.text, emailController.text, userType);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: initScreen(context),
      ),
    );
  }

  initScreen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 50.0, left: 30.0),
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 30.0, color: Colors.green),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: nameController,
            style: TextStyle(fontSize: 30.0, color: Colors.green),
            maxLines: 1,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.lightGreen, width: 2.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30),
                  ),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Enter Your Name",
                fillColor: Colors.white),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
          child: TextFormField(
            readOnly: true,
            //controller: phoneController,
            style: TextStyle(fontSize: 30.0, color: Colors.green),
            maxLines: 1,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.lightGreen, width: 2.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30),
                  ),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "${widget.phoneNumber}",
                fillColor: Colors.white), // Hiding words
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
          child: TextFormField(
            controller: emailController,
            style: TextStyle(fontSize: 30.0, color: Colors.green),
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.lightGreen, width: 2.0),
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(30),
                  ),
                ),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Enter Your Email",
                fillColor: Colors.white),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
          padding: const EdgeInsets.all(20.0),
          child: DropdownButton(
            // value: userType,
            style: TextStyle(color: Colors.green, fontSize: 30.0),
            icon: Icon(Icons.keyboard_arrow_down),
            items: <String>['SHOP', 'FARMER', 'CUSTOMER']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text(
              userType,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            onChanged: (value) => changeCat(value),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 30.0),
            child: (_futureAlbum == null)
                ? RaisedButton(
                    onPressed:
                        homeScreen, // When Click on Button goto Login Screen
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      child: Container(
                        constraints: const BoxConstraints(
                            maxWidth: 200.0,
                            minHeight: 40.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: const Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 30.0),
                        ),
                      ),
                    ),
                  )
                : i == 0
                    ? buildFutureBuilder(context)
                    : Container(),
          ),
        ),
      ],
    );
  }

  FutureBuilder<RegistrationModel> buildFutureBuilder(contextw) {
    return FutureBuilder<RegistrationModel>(
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
          }
          print("RegistrationModel future response ");
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            if (CheckUserType == "FARMER") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FarmerScreen()));
            }
            if (CheckUserType == "CUSTOMER") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CustomerScreen()));
            }
            if (CheckUserType == "SHOP") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FarmerShop()));
            }
          });
          Navigator.pop(contextw);
        } else if (snapshot.hasError) {
          // return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
  }
}
