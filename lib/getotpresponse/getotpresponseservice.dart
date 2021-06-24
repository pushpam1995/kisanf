import 'dart:convert';

import 'getotpresponsemodel.dart';
import 'package:http/http.dart' as http;

Future<String> getOtpResponseService() async{
var url="https://reqres.in/api/users";
Map data={
  "name": "morpheus",
  "job": "leader"
};
var body=json.encode(data);

var response = await http.post(Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: body
);
//String jsonresponse=json.decode(response.body);
if(response.statusCode==201){


  return response.statusCode.toString();
}
else
  return response.statusCode.toString();

}