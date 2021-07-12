
class ShopCategoryModel {
  ShopCategoryModel({
    required this.statusCode,
    required this.message,
    required this.payload,
    required this.timeStamp,
  });

  int statusCode;
  String message;
  List<Payload> payload;
  String timeStamp;

  factory ShopCategoryModel.fromJson(Map<String, dynamic> json) => ShopCategoryModel(
    statusCode: json["statusCode"],
    message: json["message"],
    payload: List<Payload>.from(json["payload"].map((x) => Payload.fromJson(x))),
    timeStamp: json["timeStamp"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "payload": List<dynamic>.from(payload.map((x) => x.toJson())),
    "timeStamp": timeStamp,
  };
}

class Payload {
  Payload({
    required this.categoryId,
    required this.name,
    required this.description,
    required this.userType,
    this.thumbnailUrl,
  });

  int categoryId;
  String name;
  String description;
  String userType;
  dynamic thumbnailUrl;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    categoryId: json["categoryId"],
    name: json["name"],
    description: json["description"],
    userType: json["userType"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "name": name,
    "description": description,
    "userType": userType,
    "thumbnailUrl": thumbnailUrl,
  };
}
