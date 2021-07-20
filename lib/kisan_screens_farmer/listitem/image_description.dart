import 'package:flutter/material.dart';

import 'data_model_filling_file.dart';

class VideoDescription extends StatefulWidget {
  VideoDescription({
    required this.title,
    required this.category,
    required this.price, required this.Aquantity,
  });

  final String title;
  final String category;
  final double price;
  final int Aquantity;

  @override
  _VideoDescriptionState createState() => _VideoDescriptionState();
}

class _VideoDescriptionState extends State<VideoDescription> {
  int quan = DataModeFillingFile().quantity;

  void quantityAdd() {
    setState(() {
      quan += 1;
    });
  }

  void quantitySub() {
    setState(() {
      quan -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            widget.category,
            style: const TextStyle(fontSize: 12.0),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            '${widget.price} /kg',
            style: const TextStyle(fontSize: 12.0),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: FittedBox(
              child: Row(
                children: [
                  Text(
                    "Order Quantity: ",
                    style: TextStyle(fontSize: 10.0),
                  ),
                  TextButton(
                    onPressed: quantityAdd,
                    child: Text(
                      "+",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "${quan.toString()} kg",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: quantitySub,
                    child: Text(
                      "-",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //    Icon(Icons.minu)
                ],
              ),
            ),
          ),
          /*TextButton(onPressed: () {},
              child: Text("Take/Upload Picture", style: TextStyle(color: Theme
                  .of(context)
                  .primaryColor, fontWeight: FontWeight.bold),),),*/
          Text(
            "Available Quantity: ${widget.Aquantity} kg ",
            style: TextStyle(fontSize: 10.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Buy Item",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
