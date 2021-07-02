import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kisan_dost_app/getregisteruserresponse/registerationmodel.dart';

Future<RegistrationModel> registerUser(String phoneNumber,String deviceId,String name,String email,String usertype) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': phoneNumber,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    //  print("this is your response "+GetOtpModel.fromJson(jsonDecode(response.body)).message);
    return RegistrationModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}