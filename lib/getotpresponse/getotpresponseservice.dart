import 'dart:convert';
import 'package:http/http.dart' as http;
import 'getotpresponsemodel.dart';

Future<GetOtpModel> createOtp(String phoneNumber,String deviceId) async {
  final response = await http.post(
    Uri.parse('http://kisandosth-elb-1255426508.ap-south-1.elb.amazonaws.com/user/otp'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'phoneNumber': phoneNumber,
      'deviceId': deviceId,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("this is your response "+GetOtpModel.fromJson(jsonDecode(response.body)).message);
    return GetOtpModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
/*
Future<GetOtpModel> createOtp(String phoneNumber,String deviceId) async {
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
    return GetOtpModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}*/
