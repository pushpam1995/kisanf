import 'package:flutter/material.dart';

class QuantityAddSubtract extends StatefulWidget{
  @override
  QuantityAddSubtractState createState() => QuantityAddSubtractState();
}

class QuantityAddSubtractState extends State<QuantityAddSubtract> {
  final isSelected = <bool>[false, false, false];
  @override
  Widget build(BuildContext context) {
   return ToggleButtons(
     color: Colors.black.withOpacity(0.60),
     selectedColor: Color(0xFF6200EE),
     selectedBorderColor: Color(0xFF6200EE),
     fillColor: Color(0xFF6200EE).withOpacity(0.08),
     splashColor: Color(0xFF6200EE).withOpacity(0.12),
     hoverColor: Color(0xFF6200EE).withOpacity(0.04),
     borderRadius: BorderRadius.circular(4.0),
     isSelected: isSelected,
     onPressed: (index) {
       // Respond to button selection
       setState(() {
         isSelected[index] = !isSelected[index];
       });
     },
     children: [
       Icon(Icons.favorite),
       Icon(Icons.visibility),
       Icon(Icons.notifications),
     ],
   );
  }
}