class LoginModel {
  final bool status;
  final Data data;
  final String message;

  LoginModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      data: Data.fromJson(json['data']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
      'message': message,
    };
  }
}

class Data {
  final String token;
  final int id;
  final String name;
  final String email;
  final String mobile;
  final int zoneId;
  final int expiresIn;

  Data({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.zoneId,
    required this.expiresIn,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      zoneId: json['zone_id'],
      expiresIn: json['expires_in'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'zone_id': zoneId,
      'expires_in': expiresIn,
    };
  }
}
