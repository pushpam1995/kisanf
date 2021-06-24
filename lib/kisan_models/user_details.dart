import 'dart:convert';


FarmerDetails userModelFromJson(String str) =>
    FarmerDetails.fromJson(json.decode(str));

String userModelToJson(FarmerDetails data) => json.encode(data.toJson());

class FarmerDetails {
  FarmerDetails({
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.userType,
    required this.email,
    required this.deviceId,
    required this.status,
    required this.createdDate,
  });
/*
  FarmerDetails.otpScreen(
      {required this.phoneNumber, required this.deviceId});
*/

  int userId;
  String name;
  String phoneNumber;
  String userType;
  String email;
  String deviceId;
  String status;
  String createdDate;

  factory FarmerDetails.fromJson(Map<String, dynamic> json) => FarmerDetails(
        userId: json["userId"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        userType: json["userType"],
        email: json["email"],
        deviceId: json["deviceId"],
        status: json["status"],
        createdDate: json["createdDate"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "phoneNumber": phoneNumber,
        "userType": userType,
        "email": email,
        "deviceId": deviceId,
        "status": status,
        "createdDate": createdDate,
      };
}
