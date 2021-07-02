class RegistrationModel {
  final int id;
  final String title;

  RegistrationModel({required this.id, required this.title});

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      id: json['id'],
      title: json['title'],
    );
  }
}