import 'package:bbs_ec/data/model/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomModals {
  static Future<void> showAlertModal(
      String contentText, String buttonText) async {
    await Get.dialog(
        barrierDismissible: true,
        Dialog(
          backgroundColor: Colors.transparent,
          child: WillPopScope(
            onWillPop: () async => false,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Text(contentText,
                          style: TextStyle(
                            fontSize: Global.isIPad ? 24 : 20,
                            color: Colors.blueGrey,
                          ),
                          textAlign: TextAlign.center),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: Get.width / 2,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            buttonText,
                            style: TextStyle(
                              fontSize: Global.isIPad ? 24 : 20,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
