import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kisan_dost_app/getregisteruserresponse/registerationmodel.dart';

Future<RegistrationModel> registerUser(String phoneNumber,String deviceId,String name,String email,String usertype) async {
  final response = await http.post(
    Uri.parse('http://kisandosth-elb-1255426508.ap-south-1.elb.amazonaws.com/user'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "userId": null,
      "name": name,
      "phoneNumber": phoneNumber,
      "userType": usertype,
      "email": email, 
      "deviceId": deviceId,
      "status": null,
      "createdDate": null
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    //  print("this is your response "+RegistrationModel.fromJson(jsonDecode(response.body)));
    return RegistrationModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}