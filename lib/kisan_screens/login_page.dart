import 'package:flutter/material.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/main.dart';

import 'signup_screen.dart';
class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final username_controller = TextEditingController();
  final phnumber_controller = TextEditingController();
  final password_controller = TextEditingController();
 // SharedPreferences logindata;
 late bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    phnumber_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Farmer Connecto.."),
      ),
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
          margin: EdgeInsets.only(top: 20.0, left: 30.0),
          child: Text(
            "Login Form",
            style: TextStyle(fontSize: 30.0),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
          child: TextFormField(
            decoration: InputDecoration(
                labelText: "Phone Number", border: OutlineInputBorder()),
            minLines: 1,
            keyboardType: TextInputType.phone,
            autofocus: false,
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Password", // Set text upper animation
              border: OutlineInputBorder(),
            ),
            minLines: 1,
            autofocus: false,
            keyboardType: TextInputType.text,
            obscureText: true, // Hiding words
          ),
        ),

        // Login Button
        Center(
            child: Container(
                margin: EdgeInsets.only(top: 50.0),
                child: RaisedButton(
                  onPressed: () {
                    String phnumber = phnumber_controller.text;
                    /* String username = username_controller.text;
                String phnumber = phnumber_controller.text;
                    String password = password_controller.text;
                    if (password != ''&& phnumber !='') {
                      print('Successfull');
                      logindata.setBool('login', false);
                      logindata.setString('username', username);
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => MyDashboard()));
                    }*/
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FarmerScreen()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        /*gradient: LinearGradient(colors: [new Color(0xff374ABE), new Color(0xff64B6FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight
                        ),*/
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Container(
                      constraints: const BoxConstraints(
                          maxWidth: 200.0,
                          minHeight: 40.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'Log in',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ))),

        Center(
            child: Container(
                padding: EdgeInsets.only(bottom: 30.0),
                margin: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't Have any account? "),
                    GestureDetector(
                      child: Text(
                        "  Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpScreen(deviceId: "abc-device",phoneNumber: phnumber_controller.text,)));
                      },
                    )
                  ],
                )))
      ],
    );
  }
}
