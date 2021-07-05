import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kisan_dost_app/getregisteruserresponse/registerationmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<RegistrationModel> registerUser(String phoneNumber, String deviceId,
    String name, String email, String usertype) async {
  final response = await http.post(
    Uri.parse(
        'http://kisandosth-elb-1255426508.ap-south-1.elb.amazonaws.com/user'),
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

  if (response.statusCode == 201) {
print("correct response :  dsdsdsdsdsdsdaasaa");
    return RegistrationModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("worng response :  dsdsdsdsdsdsdaasaa");
    throw Exception('Failed to create album.');
  }
}

/*
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
<<<<<<< HEAD
    print(
        "this is your response ${RegistrationModel.fromJson(jsonDecode(response.body)).payload!.phoneNumber.toString()}");
=======
  //  print("this is your response "+GetOtpModel.fromJson(jsonDecode(response.body)).message);
>>>>>>> 648daad3464f014ed660550c600e4a224be1405b
    return RegistrationModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
<<<<<<< HEAD
}
=======
}*/
>>>>>>> 648daad3464f014ed660550c600e4a224be1405b
