class AuthModel {
  AuthModel({required this.token, required this.refreshToken});
  late final String token;
  late final String refreshToken;

  AuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
