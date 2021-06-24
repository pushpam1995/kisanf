import 'package:flutter/material.dart';

class NavegationDrawerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home "),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text("Order History "),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          leading: Icon(Icons.home_outlined),
          title: Text("Shop Address "),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout "),
          trailing: Icon(Icons.arrow_forward),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text("About "),
          trailing: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
