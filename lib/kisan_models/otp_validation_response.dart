import 'dart:convert';

import 'user_details.dart';



/*

UserResponseModel otpResponseModelFromJson(String str) =>
    UserResponseModel.fromJson(json.decode(str));
*/

String otpResponseModelToJson(UserResponseModel data) =>
    json.encode(data.toJson());

class UserResponseModel {
  UserResponseModel({
    required this.statusCode,
    required this.message,
    required this.payload,
    required this.timeStamp,
  });

  int statusCode;
  String message;
  FarmerDetails payload;
  String timeStamp;

 /* factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        statusCode: json["statusCode"],
        message: json["message"],
        payload: json["payload"] != null
            ? FarmerDetails.fromJson(json["payload"])
            : null,
        timeStamp: json["timeStamp"],
      );
*/
  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "payload": payload.toJson(),
        "timeStamp": timeStamp,
      };
}
