import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

void showCustomSnackBar(String? message,
    {bool isError = true, int? durationInSec}) {
  if (message != null && message.isNotEmpty && Get.context != null) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      dismissDirection: DismissDirection.horizontal,
      margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
      duration: Duration(seconds: durationInSec ?? 3),
      backgroundColor: isError ? Colors.red : Colors.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL)),
      content: Text(
        message,
      ),
    ));
  }
}
