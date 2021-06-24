import 'package:flutter/material.dart';

import 'OnClickOfListItemCustomerScreenScrollPhotoDesign.dart';

class OnClickOfListItemCustomerScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:OnClickOfListItemCustomerScreenDesign() ,);
  }
}
class OnClickOfListItemCustomerScreenDesign extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: LayoutBuilder(builder:(BuildContext buildContext,BoxConstraints constraints){
      return  Column(children: [
          Container(height: constraints.maxHeight*0.4,child: OnClickOfListItemCustomerScreenScrollPhotoDesign(),),

        Container(margin: EdgeInsets.all(10),height:constraints.maxHeight*0.2 ,child: Card(child: Column(children: [
          Text("Farmer Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          SizedBox(height: 5,),
          Text("Farmer Name : Parmod G"),
          SizedBox(height: 10,),
          Text("Farmer Contact : 9913056720"),
          SizedBox(height: 10,),
          Text("Farmer address : Embassy Golf Links Road, Embassy Golf Links Business Park, Domlur, Bengaluru, Karnataka 560071"),
        ],),),),
      Container(
      child: Image.asset("mapp.png"),
      height: 250,
       width: 500,
      ),
      //Center(child: Text(SubjectName().subjectName[_index])),

      ],);
    } ,

    ),),);
  }
}
