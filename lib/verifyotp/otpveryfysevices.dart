import 'dart:convert';
import 'package:http/http.dart' as http;

import 'otpveryfymodel.dart';


Future<OtpVerify> verifyOtp(String otp,String phoneNo) async {
  final response = await http.post(
    Uri.parse('http://kisandosth-elb-1255426508.ap-south-1.elb.amazonaws.com/user/otp/verify'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "phoneNumber": phoneNo,
       "otp": otp
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return OtpVerify.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}