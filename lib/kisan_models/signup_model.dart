

class SignupModel {
  final String userId;
  final String status;
  final String phoneNumber;
  final String deviceId;
  final String name;
  final String userType;
  final String email;
  final String createdDate;

  SignupModel(
      {required this.phoneNumber,
      required this.deviceId,
      required this.userId,
      required this.name,
      required this.userType,
      required this.email,
      required this.createdDate,
      required this.status});

/*  SignupModel.registrationResponse(
      {@required this.userPhoneNumber,
      @required this.userDeviceId,
      @required this.userOtp});*/

  Map<String, String> toJson() => {
        "phoneNumber": phoneNumber,
        "deviceId": deviceId,
        "email": email,
        "userType": userType,
        "name": name,
        "createdDate": "",
        "userId": "",
        "status": "",
      };
  Map<String, String> toJsoncheck() => {
        "userId": "",
        "name": name,
        "phoneNumber": phoneNumber,
        "userType": userType,
        "email": email,
        "deviceId": "x-device-id",
        "status": "",
        "createdDate": ""
      };
}

/*Map<String, String> toJsonOtpResponse() => {
 '9844883200       "phoneNumber": userPhoneNumber,
        "deviceId": userDeviceId,
        "otp": userOtp,
      };*/
