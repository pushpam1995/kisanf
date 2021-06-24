import 'package:flutter/material.dart';
class OnClickOfListItemCustomerScreenScrollPhotoDesign extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PageView.builder(itemCount: 5,itemBuilder: (BuildContext context,index){
      return  Container(
        child:Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png',
          fit: BoxFit.fill,
          //height: 250,
          // width: 500,
        ),
        //Center(child: Text(SubjectName().subjectName[_index])),
      );
    });
  }
}
