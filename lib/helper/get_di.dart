/*
	 * Created by Aqib
	 * Created on Sun Oct 04 2023
	 *
	 * Updated by 
	 * Updated on 
	 *
	 * Reviewed by 
	 * Updated on 
	 *
	 * Screen Name: get_di.dart
	 * Description: 
	 *
	 * Copyright (c) 2023 a2i
 */


import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth_controller.dart';
import '../data/api/api_client.dart';
import '../data/repo/auth_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  // Repository
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));


  //controller
  // Get.lazyPut(() => InternetController());
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}