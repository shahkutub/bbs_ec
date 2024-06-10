import 'package:bbs_ec/controllers/auth_controller.dart';
import 'package:bbs_ec/data/model/finger_account.dart';
import 'package:bbs_ec/data/repo/settings_repo.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class SettingsController extends GetxController implements GetxService {
  SettingsRepo settingsRepo;
  SettingsController({required this.settingsRepo});

  FingerAccount? finger;
  bool isBiometricActive = false;

  final LocalAuthentication auth = LocalAuthentication();
  SupportState _supportState = SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'অথোরাইজিড করা নাই';
  bool _isAuthenticating = false;

  SupportState get supportState => _supportState;
  bool? get canCheckBiometrics => _canCheckBiometrics;
  List<BiometricType>? get availableBiometrics => _availableBiometrics;
  String get authorized => _authorized;
  bool get isAuthenticating => _isAuthenticating;

  bool supported = false;

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  void initialize() {
    getAllFingerData();
    auth.isDeviceSupported().then((bool isSupported) => _supportState =
        isSupported ? SupportState.supported : SupportState.unsupported);
    if (_supportState == SupportState.supported) {
      checkBiometrics();
    }
    // update();
  }

  bool fingerPrintSupported(SupportState state) {
    return state == SupportState.supported;
  }

  Future<void> checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e.toString());
      canCheckBiometrics = false;
    }
    _canCheckBiometrics = canCheckBiometrics;
    update();
  }

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      _isAuthenticating = true;
      _authorized = 'অথেন্টিকেটিং..';

      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      _isAuthenticating = false;
    } on PlatformException catch (e) {
      _isAuthenticating = false;
      _authorized = 'Error - ${e.message}';
    }
    isBiometricActive = authenticated;
    _authorized = authenticated ? 'অথোরাইজিড' : 'অথোরাইজিড করা নাই';
    if (authenticated) {
      switchFingerPrintSettings(authenticated);
    }
    update();
  }

  //This is for Login Use
  Future<bool> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      _isAuthenticating = true;
      _authorized = 'অথেন্টিকেটিং..';

      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      _isAuthenticating = false;
      _authorized = 'অথেন্টিকেটিং..';
    } on PlatformException catch (e) {
      _isAuthenticating = false;
      _authorized = 'Error - ${e.message}';
    }

    final String message = authenticated ? 'অথোরাইজিড' : 'অথোরাইজিড করা নাই';
    _authorized = message;
    return authenticated;
  }

  Future<void> cancelAuthentication() async {
    bool stopAuthenticated = await auth.stopAuthentication();
    _authorized = stopAuthenticated ? 'অথোরাইজিড করা নাই' : 'অথোরাইজিড';
    isBiometricActive = !stopAuthenticated;
    _isAuthenticating = false;
    if (stopAuthenticated) {
      switchFingerPrintSettings(!stopAuthenticated);
    }
    update();
  }

  bool support() {
    return fingerPrintSupported(supportState);
  }

  Future<FingerAccount?> userExistForFinger() async {
    FingerAccount? fingers = settingsRepo.getFingerPrintData();
    return fingers;
  }

  void getAllFingerData() async {
    finger = settingsRepo.getFingerPrintData();
    if (finger != null) {
      isBiometricActive =
          finger!.userId == Get.find<AuthController>().getUserId();
      _authorized = isBiometricActive ? 'অথোরাইজিড' : 'অথোরাইজিড করা নাই';
    }
    update();
  }

  void switchFingerPrintSettings(bool switch_on) async {
    if (switch_on) {
      final finger = await insertFingerAccount(switch_on ? 1 : 0);
      await settingsRepo.saveFingerPrintData(finger);
    } else {
      settingsRepo.removeFingerPrintData();
    }
    getAllFingerData();
  }
}

Future<FingerAccount> insertFingerAccount(int swtch) async {
  return FingerAccount(
    userId: Get.find<AuthController>().getUserId(),
    password: Get.find<AuthController>().getUserPassword(),
    swtch: swtch,
  );
}

enum SupportState {
  unknown,
  supported,
  unsupported,
}
