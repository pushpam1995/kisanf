import 'package:flutter/material.dart';

class HorizontalItemScroll extends StatefulWidget{
  @override
  _HorizontalItemScrollState createState() => _HorizontalItemScrollState();
}

class _HorizontalItemScrollState extends State<HorizontalItemScroll> {
  List<String> categories=["abcd","abcedef","abcd","abcedef","abcd","abcedef","abcd","abcedef","abcd","abcedef","abcd","abcedef","abcd","abcedef","abcd","abcedef","abcd","abcedef"];
  List _selectedIndexs=[];
 int setcolor=0;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(scrollDirection: Axis.horizontal,itemCount: categories.length,itemBuilder: (_,i){
      final _isSelected=_selectedIndexs.contains(i);
          return Wrap(
            children: [ InkWell(onTap: (){

              setState((){
                if(_isSelected){
                  _selectedIndexs.remove(i);

                }else{
                  _selectedIndexs.add(i);

                }
              });

            },
              child: Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Colors.grey),color: _isSelected?Colors.red:null,

              ),child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(categories[i]),
              ),margin: EdgeInsets.all(10),),
            ),
         ], );
    });
  }
}