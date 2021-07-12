import 'dart:convert';

import 'package:kisan_dost_app/postshopitemandgettheresponse/postshopitemmodel.dart';
import 'package:http/http.dart' as http;

Future<PostShopItemModel> postItemDetails(
    String name, String description, shopId, price, quantity, category) async {
  print("inside postItemDetails");
  final response = await http.post(
    Uri.parse('http://www.kisandosth.com/item'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
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
    print("inside if");
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
   //   print("this is your response "+PostShopItemModel.fromJson(jsonDecode(response.body).message.toString());
    return PostShopItemModel.fromJson(jsonDecode(response.body));
  } else {
    print("inside else");
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

/*
Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

*/
