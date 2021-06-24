import 'package:flutter/material.dart';

import 'image_description.dart';


class CustomListItem extends StatefulWidget {
  const CustomListItem({
    required this.thumbnail,
    required this.popup,
    required this.title,
    required this.category,
    required this.price,
    required this.index,
  });
 final int index;
  final Function popup;
  final Widget thumbnail;
  final String title;
  final String category;
  final double price;

  @override
  _CustomListItemState createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: widget.thumbnail,
          ),
          Expanded(
            flex: 3,
            child: VideoDescription(
              title: widget.title,
              category: widget.category,
              price: widget.price,
            ),
          ),
          //vertical dot...
          /*IconButton(
            icon: const Icon(
              Icons.more_vert,
              size: 18.0,


            ),
            */ /**/ /*
          ),*/
          PopupMenuButton<String>(
            // onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Edit', 'Delete'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            onSelected: (value)=>sendSelectevalueromMenu(value),
          ),
        ],
      ),
    );
  }

  void sendSelectevalueromMenu(value){
   widget.popup(value,widget.index);
  }


}