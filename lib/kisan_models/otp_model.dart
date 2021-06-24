

class OtpModel {
  String phoneNumber;
  String deviceId;
  String otp;

  OtpModel(
      {required this.phoneNumber,
      required this.deviceId,
      required this.otp});

  /*OtpModel.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    deviceId = json['deviceId'];
    otp = json['otp'];
  }
*/
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['deviceId'] = this.deviceId;
    data['otp'] = this.otp;
    return data;
  }

  @override
  String toString() {
    return '"OtpModel" : { "number": $phoneNumber, "deviceId": $deviceId, "otp": $otp}';
  }
}
