import 'package:flutter/material.dart';

import 'data_model_filling_file.dart';

class VideoDescription extends StatefulWidget {
  VideoDescription({
    required this.title,
    required this.category,
    required this.price,
  });

  final String title;
  final String category;
  final double price;

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
              fontSize: 22.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0,)),
          Text(
            widget.category,
            style: const TextStyle(fontSize: 15.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Text(
            '${widget.price} /-',
            style: const TextStyle(fontSize: 15.0),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: FittedBox(
              child: Row(
                children: [
                  Text("Quantity: "),
                  TextButton(
                    onPressed: quantityAdd,
                    child: Text(
                      "+",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(quan.toString(),
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  TextButton(
                    onPressed: quantitySub,
                    child: Text(
                      "-",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //    Icon(Icons.minu)
                ],
              ),

            ),
          ),
             TextButton(onPressed: () {},
              child: Text("Take/Upload Picture", style: TextStyle(color: Theme
                  .of(context)
                  .primaryColor, fontWeight: FontWeight.bold),),),

        ],
      ),
    );
  }
}
