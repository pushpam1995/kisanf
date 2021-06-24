
import "package:flutter/material.dart";

import 'data_model_filling_file.dart';
class StackWidetSample extends StatelessWidget {
final double height;
final double width;
  StackWidetSample(this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
          children: <Widget>[
            /*Container(
              width: width,
              height: height,
              decoration:
              BoxDecoration(
                  shape: BoxShape
                      .circle,
                  color: Colors
                      .white),
            ),
*/

            Container(

              alignment: Alignment.center,
              child: Image.network(
                'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
              //  height: 250,
                width: width,
                height: height,
                fit: BoxFit.cover,

              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
               // alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      DataModeFillingFile().insideImageTextOne,
                      style: TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    Text(
                      DataModeFillingFile().insideImageTextTwo,
                      style: TextStyle(color: Colors.lightGreenAccent, fontSize: 15.0),
                    ),
                  ],
                ),),

          ],
        ),
    );


  }
}