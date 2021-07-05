
class OtpVerify {
  int? statusCode;
  String? message;
   Payload? payload;
  String?timeStamp;

  OtpVerify({required this.statusCode, required this.message, required this.payload, required this.timeStamp});

  OtpVerify.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    payload =
    (json['payload']== null ? null:new Payload.fromJson(json['payload']) );
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['timeStamp'] = this.timeStamp;
    return data;
  }
}

class Payload {
  int? userId;
  String? name;
  String? phoneNumber;
  String? userType;
  String? email;
  String? deviceId;
  String? status;
  String? imageUrl;
  String? createdDate;

  Payload(
      {required this.userId,
        required this.name,
        required this.phoneNumber,
        required this.userType,
        required this.email,
        required this.deviceId,
        required this.status,
        required this.imageUrl,
        required this.createdDate});

  Payload.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    userType = json['userType'];
    email = json['email'];
    deviceId = json['deviceId'];
    status = json['status'];
    imageUrl = json['imageUrl'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['userType'] = this.userType;
    data['email'] = this.email;
    data['deviceId'] = this.deviceId;
    data['status'] = this.status;
    data['imageUrl'] = this.imageUrl;
    data['createdDate'] = this.createdDate;
    return data;
  }
}