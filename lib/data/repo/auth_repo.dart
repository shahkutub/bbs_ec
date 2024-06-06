/*
	 * Created by Aqib
	 * Created on Sun Oct 02 2023
	 *
	 * Updated by Aqib
	 * Updated on Tue Oct 10 2023
	 *
	 * Reviewed by 
	 * Updated on 
	 *
	 * Screen Name: auth_repo.dart
	 * Description: 
	 *
	 * Copyright (c) 2023 a2i
 */
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login(
      {required String userId, required String password}) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URI, {"email": userId, "password": password});
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<bool> logout() async {
    return await sharedPreferences.remove(AppConstants.TOKEN);
  }

  // for  user token
  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<bool> saveLogin(String jsonString) async {
    return await sharedPreferences.setString(AppConstants.USER, jsonString);
  }

  String getUser() {
    return sharedPreferences.getString(AppConstants.USER) ?? "";
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }

  // for  user cred (remember me)
  Future<void> rememberMe(bool val) async {
    await sharedPreferences.setBool(AppConstants.REMEMBER_ME, val);
  }

  // for  user cred (remember me)
  Future<void> saveUserCred(
      {required String userId, required String password}) async {
    return await _saveUserIdAndPassword(userId, password);
  }

  Future<void> clearUserCred() async {
    await _clearUserNumberAndPassword();
  }

  Future<void> _saveUserIdAndPassword(String userId, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_PASSWORD, password);
      await sharedPreferences.setString(AppConstants.USER_ID, userId);
    } catch (e) {
      rethrow;
    }
  }

  bool getRememberMe() {
    return sharedPreferences.getBool(AppConstants.REMEMBER_ME) ?? false;
  }

  String getUserId() {
    return sharedPreferences.getString(AppConstants.USER_ID) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

  Future<void> _clearUserNumberAndPassword() async {
    await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    await sharedPreferences.remove(AppConstants.USER_ID);
  }
}
