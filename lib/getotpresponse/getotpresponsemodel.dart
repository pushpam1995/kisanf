

class GetOtpModel {
  final int statusCode;
 String message;
final int payload;
final String timeStamp;

  GetOtpModel({required this.statusCode, required this.message,required this.timeStamp,this.payload=0});

  factory GetOtpModel.fromJson(Map<String, dynamic> json) {
    return GetOtpModel(
      statusCode: json['statusCode'],
      message: json['message'],
      payload: json['payload'],
      timeStamp: json['timeStamp'],
    );
  }
}

/*
class GetOtpModel {
  final int id;
  final String title;

  GetOtpModel({required this.id, required this.title});

  factory GetOtpModel.fromJson(Map<String, dynamic> json) {
    return GetOtpModel(
      id: json['id'],
      title: json['title'],
    );
  }
}*/
