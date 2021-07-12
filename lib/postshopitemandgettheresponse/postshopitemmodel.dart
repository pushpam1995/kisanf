class PostShopItemModel {
  int? statusCode;
  String? message;
  Payload? payload;
  String? timeStamp;

  PostShopItemModel({required this.statusCode, required this.message, required this.payload, required this.timeStamp});

  PostShopItemModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    payload =
    (json['payload'] != null ? new Payload.fromJson(json['payload']) : null)!;
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
  int? itemId;
  String? name;
  String? description;
  int? shopId;
  int? categoryId;
  double? unitPrice;
  String? unit;
  int? quantity;
  String? imageUrl;
  String? updatedDate;

  Payload(
      {required this.itemId,
        required this.name,
        required this.description,
        required this.shopId,
        required this.categoryId,
        required this.unitPrice,
        required this.unit,
        required this.quantity,
        required this.imageUrl,
        required this.updatedDate});

  Payload.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    name = json['name'];
    description = json['description'];
    shopId = json['shopId'];
    categoryId = json['categoryId'];
    unitPrice = json['unitPrice'];
    unit = json['unit'];
    quantity = json['quantity'];
    imageUrl = json['imageUrl'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['shopId'] = this.shopId;
    data['categoryId'] = this.categoryId;
    data['unitPrice'] = this.unitPrice;
    data['unit'] = this.unit;
    data['quantity'] = this.quantity;
    data['imageUrl'] = this.imageUrl;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}

/*
class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}
*/
