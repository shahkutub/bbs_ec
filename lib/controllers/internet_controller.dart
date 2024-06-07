/*
	 * Created by Aqib
	 * Created on Mon Oct 09 2023
	 *
	 * Updated by 
	 * Updated on 
	 *
	 * Reviewed by 
	 * Updated on 
	 *
	 * Screen Name: internet_controller.dart
	 * Description: This controller actively checks for internet access.
	 *
	 * Copyright (c) 2023 a2i
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../views/shared/custom_sneakbar.dart';

class InternetController extends GetxController implements GetxService {
  bool _connected = false;
  late StreamSubscription<InternetConnectionStatus> _listener;

  bool get connectedToNet => _connected;

  void changeConnectedStatus(bool val) {
    _connected = val;
  }

  @override
  void onInit() {
    super.onInit();
    // actively listen for status updates
    // this will cause InternetConnectionChecker to check periodically
    // with the interval specified in InternetConnectionChecker().checkInterval
    // until listener.cancel() is called
    _listener =
        InternetConnectionChecker().onStatusChange.listen((status) async {
      switch (status) {
        case InternetConnectionStatus.connected:
          _connected = true;
          debugPrint('you are ONLINE');
          break;
        case InternetConnectionStatus.disconnected:
          _connected = false;
          debugPrint('you are OFFLINE');
          showCustomSnackBar('আপনি বর্তমানে অফলাইন মোডে আছেন।',
              isError: !_connected);
          break;
      }
    });
  }

  @override
  void onClose() {
    // Cancel the subscription when the controller is disposed of
    _listener.cancel();
    super.onClose();
  }
}
