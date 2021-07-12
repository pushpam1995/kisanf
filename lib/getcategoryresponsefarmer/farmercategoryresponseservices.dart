import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kisan_dost_app/getcategoryresponsefarmer/farmercategoryresponsemodel.dart';

Future<FarmerCategoryResponseModel> fetchfarmercategory() async {
  final response =
  await http.get(Uri.parse('http://www.kisandosth.com/category/FARMER'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return FarmerCategoryResponseModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}