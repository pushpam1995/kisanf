

import 'package:flutter/material.dart';

import 'ItemListInsideCustomerScreen.dart';
import 'PaymentScreen.dart';


/// This is the main application widget.
class CheckOutScreenForBuyAllItem extends StatelessWidget {
  const CheckOutScreenForBuyAllItem({Key? key}) : super(key: key);

  static const String _title = 'all cart item';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Container(child:LayoutBuilder(builder:(BuildContext context,BoxConstraints constraint){
          return Column(
            children: [
              Container(height: constraint.maxHeight*0.64,child: const MyStatelessWidget()),
              SizedBox(height: 15,),
              Container(height: constraint.maxHeight*0.2,child: Card(child: Container(child: Column(children: [
                Row(children: [
                  Expanded(child: Text("Number of Item:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple),)),
                  Text("21 items"),

                ],),
                SizedBox(height: 15,),
                Row(children: [
                  Expanded(child: Text("Total Amount:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple),)),
                  Text("27094/-"),
                ],),

              ],),),),)
            ],
          );
        } ,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyAppPayment()),
            );
          },
          icon: Icon(Icons.shopping_basket),
          label: Text("Check Out Now "),
        ),
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.user,
    required this.viewCount,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _VideoDescription(
              title: title,
              user: user,
              viewCount: viewCount,
            ),
          ),
          Column(children: [
            TextButton(child: Text("Edit Item"),onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemListInsideCustomerScreenDesign()));
            },),

            TextButton(child: Text("Delete"),onPressed: (){},),
          ],),

        ],
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key? key,
    required this.title,
    required this.user,
    required this.viewCount,
  }) : super(key: key);

  final String title;
  final String user;
  final int viewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            user,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            '$viewCount /-',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        itemExtent: 106.0,
        children: <CustomListItem>[
          CustomListItem(
            user: 'Total Quantity 12 kg',
            viewCount: 1230,
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            title: 'Mango',
          ),
          CustomListItem(
            user: 'Total Quantity 15 kg',
            viewCount: 15900,
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.yellow),
            ),
            title: 'Apple',
          ),
          CustomListItem(
            user: 'Total Quantity 12 kg',
            viewCount: 1230,
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            title: 'Mango',
          ),
          CustomListItem(
            user: 'Total Quantity 15 kg',
            viewCount: 15900,
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.yellow),
            ),
            title: 'Apple',
          ),
          CustomListItem(
            user: 'Total Quantity 12 kg',
            viewCount: 1230,
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            title: 'Mango',
          ),
          CustomListItem(
            user: 'Total Quantity 15 kg',
            viewCount: 15900,
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.yellow),
            ),
            title: 'Apple',
          ),
          CustomListItem(
            user: 'Total Quantity 12 kg',
            viewCount: 1230,
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            ),
            title: 'Mango',
          ),
          CustomListItem(
            user: 'Total Quantity 15 kg',
            viewCount: 15900,
            thumbnail: Container(
              decoration: const BoxDecoration(color: Colors.yellow),
            ),
            title: 'Apple',
          ),
        ],
      ),
    );
  }
}
