import 'package:flutter/material.dart';

class MakePayment extends StatefulWidget {
  @override
  _MakePaymentState createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("add you image URL here "),
                        fit: BoxFit.cover)),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  child: Container(
                    alignment: Alignment(0.0, 2.5),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage("Add you profile DP image URL here "),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Parmod G",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  elevation: 2.0,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Text(
                        "FARMER",
                        style: TextStyle(
                            letterSpacing: 2.0, fontWeight: FontWeight.w300),
                      ))),
              SizedBox(
                height: 10,
              ),
              Text(
                "Mobile No: 7042659972",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Email Id: abcd@gmail.com",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 15,
              ),
              MaterialButton(minWidth: MediaQuery.of(context).size.width*0.9,
                onPressed: () {},
                child: Text("Make Payment"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //  floatingActionButton: FloatingActionButton(onPressed: _ModelBottomSheet,child: Center(child: Text("Edit")),),
    );
  }
}
