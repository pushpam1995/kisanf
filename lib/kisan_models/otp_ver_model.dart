

class OtpVerModel {
  final String userPhoneNumber;
  final String userDeviceId;
  String userOtp;

  /*OtpVerModel({required this.userPhoneNumber, required this.userDeviceId});*/

  OtpVerModel.otpResponse({required this.userPhoneNumber, required this.userDeviceId, required this.userOtp});

  Map<String, String> toJson() => {
        "phoneNumber": userPhoneNumber,
        "deviceId": userDeviceId,
      };

  Map<String, String> toJsonOtpResponse() => {
    "phoneNumber": userPhoneNumber,
    "deviceId": userDeviceId,
    "otp": userOtp,
  };

}
