import 'dart:async';
import 'dart:convert';
import 'package:bbs_ec/data/model/response/model/login_model.dart';
import 'package:get/get.dart';
import '../data/repo/auth_repo.dart';
import '../data/model/response/model/response_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo}) {
    _rememberMe = authRepo.getRememberMe();
    _teacherId = getUserId();
    _pin = getUserPassword();
  }

  bool _isLoading = false;
  late bool _rememberMe;
  int _stage = 0;
  String? _teacherId;
  String? _emailId;
  String? _teacherPhone;
  String? _teacherUniName;
  String? _teacherName;
  String? _otp;
  String? _pin;
  String? _confirmPin;
  LoginModel? _loginModel;

  int get stage => _stage;
  bool get rememberMe => _rememberMe;
  String? get teacherId => _teacherId;
  String? get teacherEmail => _emailId;
  String? get teacherName => _teacherName;
  String? get teacherPhone => _teacherPhone;
  String? get teacherUni => _teacherUniName;
  String? get otp => _otp;
  String? get pin => _pin;
  String? get confirmPin => _confirmPin;
  bool get isLoading => _isLoading;
  LoginModel get getLoginModel => _loginModel!;

  Response? testData;

  String _selectOpt = 'mobile';
  String get selectOpt => _selectOpt;

  String _otpTimer = '2:00';
  bool _resendEnable = false;
  bool _otpPageLoad = false;

  String get otpTimer => _otpTimer;
  bool get resendEnable => _resendEnable;
  bool get otpPageLoad => _otpPageLoad;

  set otpTimer(String time) {
    _otpTimer = time;
    update();
  }

  set resendEnable(bool status) {
    _resendEnable = status;
    update();
  }

  set otpPageLoad(bool status) {
    _otpPageLoad = status;
  }

  set selectOpt(String opt) {
    _selectOpt = opt;
    update();
  }

  set stage(int stage) {
    _stage = stage;
    update();
  }

  set setTeacherId(String id) {
    _teacherId = id;
    update();
  }

  set setTeacherEmail(String email) {
    _emailId = email;
    update();
  }

  set setTeacherName(String name) {
    _teacherName = name;
    update();
  }

  set setTeacherUni(String uniName) {
    _teacherUniName = uniName;
    update();
  }

  set setTeacherPhone(String phone) {
    _teacherPhone = phone;
    update();
  }

  set setOtp(String otp) {
    _otp = otp;
    update();
  }

  set setPin(String pin) {
    _pin = pin;
    update();
  }

  set setConfirmPin(String pin) {
    _confirmPin = pin;
    update();
  }

  void setLoginFromSharedPref() {
    _loginModel = LoginModel.fromJson(jsonDecode(authRepo.getUser()));
  }

  Future<void> saveUserToken(String token) async {
    await authRepo.saveUserToken(token);
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
    authRepo.rememberMe(_rememberMe);
    if (!_rememberMe) {
      authRepo.clearUserCred();
    }
    update(['remember_me']);
  }

  int _isMaintenance = 0;
  int get isMaintain => _isMaintenance;

  void setMaintenance(int val) {
    _isMaintenance = val;
    update();
  }

  Future<ResponseModel> login(String userId, String password) async {
    _isLoading = true;
    update();
    Response response =
        await authRepo.login(userId: userId, password: password);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if (response.body['status'] == true) {
        _loginModel = LoginModel.fromJson(response.body);
        authRepo.saveLogin(jsonEncode(response.body));
        if (_rememberMe) {
          authRepo.saveUserCred(userId: userId, password: password);
        }
        authRepo.saveUserToken(response.body['data']['token']);
        responseModel =
            ResponseModel(true, '${response.body['data']['token']}');
      } else {
        responseModel =
            ResponseModel(false, 'আপনার ইউজার আইডি বা পাসওয়ার্ড ভুল।');
      }
    } else if (response.statusCode == 404) {
      responseModel =
          ResponseModel(false, 'আপনার ইউজার আইডি বা পাসওয়ার্ড ভুল।');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<bool> get logout async => await authRepo.logout();

  bool get isLoggedIn {
    return authRepo.isLoggedIn();
  }

  String getUserId() {
    return authRepo.getUserId();
  }

  String getUserPassword() {
    return authRepo.getUserPassword();
  }
}
