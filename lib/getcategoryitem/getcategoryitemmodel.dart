

class GetCategoryItemModel {
  GetCategoryItemModel({
    required this.statusCode,
    required this.message,
    required this.payload,
    required this.timeStamp,
  });

  int statusCode;
  String message;
  List<Payload> payload;
  String timeStamp;

  factory GetCategoryItemModel.fromJson(Map<String, dynamic> json) => GetCategoryItemModel(
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
    required this.itemId,
    required this.name,
    required this.description,
    required this.shopId,
    required this.categoryId,
    required this.unitPrice,
    required this.unit,
    required this.quantity,
    this.imageUrl,
    this.updatedDate,
  });

  int itemId;
  String name;
  String description;
  int shopId;
  int categoryId;
  double unitPrice;
  String unit;
  int quantity;
  dynamic imageUrl;
  dynamic updatedDate;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    itemId: json["itemId"],
    name: json["name"],
    description: json["description"],
    shopId: json["shopId"],
    categoryId: json["categoryId"],
    unitPrice: json["unitPrice"],
    unit: json["unit"],
    quantity: json["quantity"],
    imageUrl: json["imageUrl"],
    updatedDate: json["updatedDate"],
  );

  Map<String, dynamic> toJson() => {
    "itemId": itemId,
    "name": name,
    "description": description,
    "shopId": shopId,
    "categoryId": categoryId,
    "unitPrice": unitPrice,
    "unit": unit,
    "quantity": quantity,
    "imageUrl": imageUrl,
    "updatedDate": updatedDate,
  };
}
