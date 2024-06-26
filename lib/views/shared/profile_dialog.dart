import 'package:bbs_ec/controllers/auth_controller.dart';
import 'package:bbs_ec/data/model/global.dart';
import 'package:bbs_ec/data/model/response/model/login_model.dart';
import 'package:bbs_ec/helper/common_method.dart';
import 'package:bbs_ec/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class ProfileDialog extends StatefulWidget {
  const ProfileDialog({
    super.key,
  });

  @override
  State<ProfileDialog> createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog>
    with TickerProviderStateMixin {
  late LoginModel user;

  @override
  void initState() {
    super.initState();
    user = Get.find<AuthController>().getLoginModel;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL)),
          insetPadding: const EdgeInsets.all(30),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SizedBox(
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Padding(
                    padding:
                        const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Icon(
                        Icons.account_circle,
                        size: 80,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'গণনাকারীর নাম', value: user.data.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'গণনাকারী নম্বর',
                        value: CommonMethods.englishToBanglaNumberConverter(
                            user.data.enumeratorNo)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child:
                        InfoWidget(title: 'মোবাইল নং', value: user.data.mobile),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'লগইন আইডি', value: user.data.email.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'জেলা', value: user.data.zone.district.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'জোন নং', value: user.data.zone.zoneName),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'সিটি কর্পোরেশন',
                        value: user.data.zone.cityCorporation.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'থানা', value: user.data.zone.upazila ?? ''),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'ওয়ার্ড নং',
                        value: CommonMethods.englishToBanglaNumberConverter(
                            user.data.zone.cityWard.wordNo)),
                  ),
                  const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  TextButton(
                      onPressed: () async {
                        await Get.find<AuthController>().logout;
                        Get.offAll(() => const SignInScreen());
                      },
                      child: Text('লগআউট',
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).errorColor,
                              fontWeight: FontWeight.w600)))
                ]),
              )),
        ),
      ],
    );
  }
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$title:",
            style: TextStyle(
                fontSize: Global.isIPad ? 22 : 18,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500)),
        Text(
          value,
          style: TextStyle(
              fontSize: Global.isIPad ? 20 : 16,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
