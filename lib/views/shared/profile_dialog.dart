import 'package:bbs_ec/controllers/auth_controller.dart';
import 'package:bbs_ec/data/model/response/model/login_model.dart';
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
                    child: InfoWidget(title: 'Name', value: user.data.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(title: 'E-mail', value: user.data.email),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(title: 'Mobile', value: user.data.mobile),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'Zone', value: user.data.zone.zoneName),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'Office',
                        value: user.data.zone.office.officeName),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'Division', value: user.data.zone.division.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: InfoWidget(
                        title: 'District', value: user.data.zone.district.name),
                  ),
                  const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  TextButton(
                      onPressed: () async {
                        await Get.find<AuthController>().logout;
                        Get.offAll(() => const SignInScreen());
                      },
                      child: Text('logout',
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
                fontSize: 20,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500)),
        Text(
          value,
          style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
