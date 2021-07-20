
import 'dart:convert';

import 'package:kisan_dost_app/updateitem/updateimetmodel.dart';
import 'package:http/http.dart' as http;

Future<UpdateItemModel> updateItem(int itemId,String name, String description, shopId, price, quantity, category) async {
  print("inside updateItem $itemId, $name, $description, $shopId, $price, $quantity, $category");
  final response = await http.put(
    Uri.parse('http://www.kisandosth.in/item'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "itemId": itemId,
      "name": name,
      "description": description,
      "shopId": shopId,
      "categoryId": category,
      "unitPrice": price,
      "unit": "kg",
      "quantity": quantity
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UpdateItemModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}
