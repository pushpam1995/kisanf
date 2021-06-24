import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisan_dost_app/kisan_screens_shop/transaction.dart';

class InputFieldPage extends StatefulWidget {
  final Function addNewItem;

  InputFieldPage(this.addNewItem);

  @override
  _InputFieldPageState createState() => _InputFieldPageState();
}

class _InputFieldPageState extends State<InputFieldPage> {
  var _errorMessage = "";
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final categoryController = TextEditingController();

  void whenItemSubmittedClick() {
    final title = titleController.text;

    final amount = amountController.text;
    if (title.isEmpty || amount.isEmpty ) {
      setState(() {
        _errorMessage = "enter valid input";
      });

      return;
    } else {
      setState(() {
        _errorMessage = "";
      });
      widget.addNewItem(Transaction(
        title: titleController.text.toString(),
        price: double.parse(amountController.text),
        category: categoryController.text.toString(),
      ));
      Navigator.of(context).pop(); //after submitted input box pop
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shadowColor: Colors.lightGreenAccent,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Column(
          children: [
            Theme(
              data: new ThemeData(
                primaryColor: Colors.lightGreenAccent,
                primaryColorDark: Colors.lightGreenAccent,
              ),
              child: Container(
                margin: EdgeInsets.all(6.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreenAccent,
                        width: 2.0,
                      ),
                    ),
                  ),
                  controller: titleController,
                  cursorColor: Colors.lightGreenAccent,
                  onSubmitted: (_) => whenItemSubmittedClick(),
                ),
              ),
            ),
            Theme(
              data: new ThemeData(
                primaryColor: Colors.lightGreenAccent,
                primaryColorDark: Colors.lightGreenAccent,
              ),
              child: Container(
                margin: EdgeInsets.all(6.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreenAccent,
                        width: 2.0,
                      ),
                    ),
                  ),
                  controller: amountController,
                  cursorColor: Colors.purple,
                  onSubmitted: (_) => whenItemSubmittedClick(),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Theme(
              data: new ThemeData(
                primaryColor: Colors.lightGreenAccent,
                primaryColorDark: Colors.lightGreenAccent,
              ),
              child: Container(
                margin: EdgeInsets.all(6.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightGreenAccent,
                        width: 2.0,
                      ),
                    ),
                  ),
                  controller: categoryController,
                  cursorColor: Colors.lightGreenAccent,
                  onSubmitted: (_) => whenItemSubmittedClick(),
                ),
              ),
            ),
            Text(
              _errorMessage.toString(),
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(105, 0, 0, 0),
                    child: TextButton(
                      onPressed: whenItemSubmittedClick,
                      child: Text("Add Item"),
                      style: TextButton.styleFrom(
                        primary: Colors.lightGreenAccent,
                        padding: EdgeInsets.all(10.0),
                        elevation: 1.0,
                        shadowColor: Colors.lightGreenAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          // crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
