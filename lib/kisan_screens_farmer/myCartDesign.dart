import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCartPage extends StatefulWidget {
  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  int deliverd = 0;
  int processing = 1;
  int cancelled = 1;

  void onTabItemSelected(indexValue) {
    if (indexValue == 0) {
      setState(() {
        deliverd = 0;
        processing = 1;
        cancelled = 1;
      });
    }
    if (indexValue == 1) {
      setState(() {
        deliverd = 1;
        processing = 0;
        cancelled = 1;
      });
    }
    if (indexValue == 2) {
      setState(() {
        deliverd = 1;
        processing = 1;
        cancelled = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              onTap: (indexValue) => onTabItemSelected(indexValue),
              tabs: [
                Tab(
                  child: Text("Delivered "),
                ),
                Tab(
                  child: Text("Processing "),
                ),
                Tab(
                  child: Text("Cancelled "),
                ),
              ],
            ),
            title: Text("Cart"),
            centerTitle: true,
          ),
          body: (deliverd == 0) ? ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    height: 180,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order No: 194732",
                              style: TextStyle(fontWeight: FontWeight.bold,),),
                            Text("10-20-2021",
                              style: TextStyle(fontWeight: FontWeight.bold,),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Order By: Promod G"),
                        SizedBox(height: 10,),
                        Text("Contact: 9943526718"),
                        SizedBox(height: 10,),
                        Text(" Mango Fruit", style: TextStyle(
                          fontWeight: FontWeight.bold,),),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Quantity: 231",
                              style: TextStyle(fontWeight: FontWeight.bold,),),
                            Text("Total Amount: 23561/-",
                              style: TextStyle(fontWeight: FontWeight.bold,),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Order Status: Delivered", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),),
                            Icon(Icons.done_outline_outlined,
                              color: Colors.purple,)
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },):(processing == 0) ? ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    height: 180,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order No: 194732",
                              style: TextStyle(fontWeight: FontWeight.bold,),),
                            Text("10-20-2021",
                              style: TextStyle(fontWeight: FontWeight.bold,),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Order By: Promod G"),
                        SizedBox(height: 10,),
                        Text("Contact: 9943526718"),
                        SizedBox(height: 10,),
                        Text(" Mango Fruit", style: TextStyle(
                          fontWeight: FontWeight.bold,),),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Quantity: 231",
                              style: TextStyle(fontWeight: FontWeight.bold,),),
                            Text("Total Amount: 23561/-",
                              style: TextStyle(fontWeight: FontWeight.bold,),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Order Status: Process...", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },):ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    height: 180,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.9,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Order No: 194732",
                              style: TextStyle(fontWeight: FontWeight.bold,),),
                            Text("10-20-2021",
                              style: TextStyle(fontWeight: FontWeight.bold,),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Order By: Promod G"),
                        SizedBox(height: 10,),
                        Text("Contact: 9943526718"),
                        SizedBox(height: 10,),
                        Text(" Mango Fruit", style: TextStyle(
                          fontWeight: FontWeight.bold,),),
                        SizedBox(height: 10,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Quantity: 231",
                              style: TextStyle(fontWeight: FontWeight.bold,),),
                            Text("Total Amount: 23561/-",
                              style: TextStyle(fontWeight: FontWeight.bold,),)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Order Status: Cancelled", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),),
                            Icon(Icons.cancel_outlined,
                              color: Colors.purple,)
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },),


        )
    );
  }
}


