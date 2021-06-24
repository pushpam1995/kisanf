class GetOtpResponseModel {
  GetOtpResponseModel({
    required this.id,
    required this.createdAt,
  });

  String id;
  DateTime createdAt;

  factory GetOtpResponseModel.fromJson(Map<String, dynamic> json) => GetOtpResponseModel(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
  };
}
