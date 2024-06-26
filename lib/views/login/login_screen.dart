import 'package:bbs_ec/data/model/global.dart';
import 'package:bbs_ec/views/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/settings_controller.dart';
import '../../data/model/finger_account.dart';
import '../../data/model/response/model/response_model.dart';
import '../shared/custom_button.dart';
import '../shared/custom_sneakbar.dart';
import '../shared/custom_text_field.dart';
import '../shared/modals.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInState();
}

class _SignInState extends State<SignInScreen> {
  // bool dataLoaded = Get.find<ConfigController>().configDataLoaded;
  final settings = Get.find<SettingsController>();

  late TextEditingController teacherIdController;
  late TextEditingController pinController;
  bool isObscure = true;

  @override
  void initState() {
    super.initState();

    teacherIdController =
        TextEditingController(text: Get.find<AuthController>().teacherId);
    pinController = TextEditingController(text: Get.find<AuthController>().pin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 53,
              ),
              Image.asset(
                'assets/bdseal.png',
                height: Global.isIPad ? 150 : 120,
                width: Global.isIPad ? 150 : 120,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'গণপ্রজাতন্ত্রী বাংলাদেশ সরকার',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'বাংলাদেশ পরিসংখ্যান ব্যুরো',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                'অর্থনৈতিক শুমারি ২০২৪ প্রকল্প',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 32,
              ),
              CustomTextField(
                leading: SvgPicture.asset('assets/svg/user-square.svg'),
                controller: teacherIdController,
                hintText: 'আপনার আইডি নম্বর প্রবেশ করুন',
                maxLines: 1,
                inputType: TextInputType.emailAddress,
                title: 'আইডি *',
                onChanged: (value) =>
                    Get.find<AuthController>().setTeacherId = value,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                trailing: InkWell(
                    onTap: () {
                      setState(() {
                        if (isObscure) {
                          isObscure = false;
                        } else {
                          isObscure = true;
                        }
                      });
                    },
                    child: isObscure
                        ? SvgPicture.asset('assets/svg/eye-slash.svg')
                        : SvgPicture.asset('assets/svg/eye.svg')),
                leading: SvgPicture.asset('assets/svg/lock.svg'),
                isPassword: true,
                isNumber: true,
                obscureText: isObscure,
                controller: pinController,
                hintText: 'আপনার পিন প্রবেশ করুন',
                maxLines: 1,
                maxLength: 6,
                title: 'পিন নম্বর *',
                onChanged: (value) => Get.find<AuthController>().setPin = value,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GetBuilder<AuthController>(
                      id: 'remember_me',
                      builder: (authController) {
                        return Checkbox(
                            visualDensity: VisualDensity.compact,
                            value: authController.rememberMe,
                            onChanged: (value) =>
                                authController.toggleRememberMe());
                      }),
                  const Text(
                    "সাইন ইন মনে রাখুন",
                    style: TextStyle(color: Color(0xFF555555), fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<AuthController>(builder: (authController) {
                return CustomButton(
                  isLoading: authController.isLoading,
                  onTap: () async {
                    authenticateViaServer(
                      authController,
                    );
                  },
                  isEnable: (authController.teacherId != null &&
                      authController.teacherId!.isNotEmpty &&
                      authController.pin != null &&
                      authController.pin!.isNotEmpty),
                  title: 'লগইন করুন',
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Color(0xFFDBFEFF),
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<SettingsController>(
                builder: (settings) {
                  print(settings.supportState);
                  return settings.supportState == SupportState.supported
                      ? GetBuilder<AuthController>(
                          builder: (auth) {
                            return GestureDetector(
                              onTap: () async {
                                FingerAccount? fingers =
                                    await settings.userExistForFinger();
                                if (fingers != null) {
                                  if (settings.isBiometricActive) {
                                    bool authenticated = await settings
                                        .authenticateWithBiometrics();
                                    if (authenticated) {
                                      var result = await auth.login(
                                          fingers.userId!, fingers.password!);
                                      if (result.isSuccess) {
                                        Get.offAll(() => const HomeScreen());
                                      } else {
                                        await CustomModals.showAlertModal(
                                            'অনুগ্রহ করে উপরের লগইন ফর্মটি পূরণ করুন এবং লগইন করুন। অতঃপর সেটিংস থেকে ফিঙ্গারপ্রিন্ট অপসনটি অন করুন।',
                                            'ধন্যবাদ');
                                      }
                                    }
                                  } else {
                                    await CustomModals.showAlertModal(
                                        'অনুগ্রহ করে সেটিংস থেকে ফিঙ্গারপ্রিন্ট অপসনটি অন করুন।',
                                        'ধন্যবাদ');
                                  }
                                } else {
                                  await CustomModals.showAlertModal(
                                      'অনুগ্রহ করে উপরের লগইন ফর্মটি পূরণ করুন এবং লগইন করুন। অতঃপর সেটিংস থেকে ফিঙ্গারপ্রিন্ট অপসনটি অন করুন।',
                                      'ধন্যবাদ');
                                }
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/fingerprint.png',
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : const SizedBox(
                          height: 100,
                          width: 100,
                        );
                },
              ),
              SizedBox(
                height: (Global.isIPad) ? 60 : 30,
              ),
              const Text.rich(TextSpan(text: 'Developed by ', children: [
                TextSpan(
                  text: 'NanoSoft',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> authenticateViaServer(
    AuthController authController,
  ) async {
    ResponseModel response = await authController.login(
        teacherIdController.text, pinController.text);
    if (response.isSuccess) {
      Get.offAll(() => const HomeScreen());
    } else {
      showCustomSnackBar(response.message, durationInSec: 6);
    }
  }
}
