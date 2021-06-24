import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data_model_filling_file.dart';
import 'imageload.dart';
import 'list_of_item.dart';


/*void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(Farmer());
}*/

class Farmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreenAccent,
      ),
      home: ShopItemDesign(),
    );
  }
}

class ShopItemDesign extends StatelessWidget {
  void _shopItem(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return MyApp();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart),
          ),
        ],
        title: Text("Farmer Connect.."),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraint) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          DataModeFillingFile().shopName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    Icon(Icons.attach_money_outlined),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Text(
                        DataModeFillingFile().amountAvailable.toString(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.green,
                // padding:EdgeInsets.all(10) ,
                height: constraint.maxHeight * 0.3,
                width: constraint.maxHeight,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    /* border: Border.all(
                     // color: Colors.red[500],
                    ),*/
                    borderRadius: BorderRadius.all(Radius.circular(30))),

                child: StackWidetSample(
                    constraint.maxHeight * 0.3, constraint.maxHeight),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _shopItem(context),
                    child: Text(
                      '      Shop Item      ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    child: Text(
                      '     Shop Order     ',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
