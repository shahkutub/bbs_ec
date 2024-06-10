import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/settings_controller.dart';
import '../../data/model/global.dart';

class FingerprintAuth extends StatefulWidget {
  const FingerprintAuth({Key? key}) : super(key: key);

  @override
  _FingerprintAuthState createState() => _FingerprintAuthState();
}

class _FingerprintAuthState extends State<FingerprintAuth> {
  final controller = Get.find<SettingsController>();

  @override
  void initState() {
    super.initState();
    controller.getAllFingerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ফিঙ্গার প্রিন্ট সেটিংস',
          style: TextStyle(fontSize: (Global.isIPad ? 30 : 24)),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(
              10), //.symmetric(vertical: 12.0, horizontal: 24.0),
          child: GetBuilder<SettingsController>(
            builder: (controller) {
              return ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'ফিঙ্গারপ্রিন্ট অথেনটিকেশন:',
                                style: TextStyle(fontSize: 18),
                              ),
                              const Spacer(),
                              CupertinoSwitch(
                                value: controller.isBiometricActive,
                                onChanged: (newValue) async {
                                  controller.isBiometricActive = newValue;
                                  controller.update();
                                  if (newValue) {
                                    controller.authenticate();
                                  } else {
                                    controller.cancelAuthentication();
                                  }
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'বর্তমান অবস্থা:',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                controller.authorized,
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                        /*Container(
                          margin: const EdgeInsets.symmetric(vertical: 15.0),
                          child: const Text(
                            "Authenticate using your fingerprint instead of your password",
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 1.5),
                          ),
                        ),*/
                      ],
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
