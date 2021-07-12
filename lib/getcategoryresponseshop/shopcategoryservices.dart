import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kisan_dost_app/getcategoryresponseshop/shopcategorymodel.dart';
Future<ShopCategoryModel> fetchShopCategory() async {
  final response =
  await http.get(Uri.parse('http://www.kisandosth.com/category/SHOP'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ShopCategoryModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}