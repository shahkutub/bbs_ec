class ErrorResponse {
  late Error _error;

  Error get error => _error;

  ErrorResponse({required Error error}) {
    _error = error;
  }

  ErrorResponse.fromJson(dynamic json) {
    if (json["message"] != null) {
      _error = Error.fromJson(json);
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["message"] = _error;
    return map;
  }
}

class Error {
  late int _code;
  late String _message;

  int get code => _code;
  String get message => _message;

  Error({required int code, required String message}) {
    _code = code;
    _message = message;
  }

  Error.fromJson(dynamic json) {
    _code = json["code"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["message"] = _message;
    return map;
  }
}
