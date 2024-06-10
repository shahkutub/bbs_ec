class FingerAccount {
  String? userId;
  String? password;
  int? swtch;

  FingerAccount({
    this.userId,
    this.password,
    this.swtch,
  });

  FingerAccount.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    password = json['password'];
    swtch = json['switch'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['user_id'] = userId;
    data['password'] = password;
    data['switch'] = swtch;
    return data;
  }
}
