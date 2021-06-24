import 'package:flutter/material.dart';

import 'checkoutScreenforbuyallitem.dart';


class MainCheckout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Checkout() ,);
  }
}

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text(
            "hello",
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckOutScreenForBuyAllItem()),
            );
          },
        ),
      ),
    );
  }
}