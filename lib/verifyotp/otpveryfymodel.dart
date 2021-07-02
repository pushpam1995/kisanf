
class OtpVerify {
  final int id;
  final String title;

  OtpVerify({required this.id, required this.title});

  factory OtpVerify.fromJson(Map<String, dynamic> json) {
    return OtpVerify(
      id: json['id'],
      title: json['title'],
    );
  }
}