import 'dart:convert';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../utils/app_constants.dart';
import '../response/error_response.dart';

class ApiClient extends GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static const String noInternetMessage = 'আপনার ডিভাইসে ইন্টারনেট চালু করুন।';
  final int timeoutInSeconds = 300;

  String? token;
  String? refresh_token;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.TOKEN);
    debugPrint('Token: $token');
    updateHeader(token);
  }

  void updateHeader(String? token) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      // 'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String uri,
      {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $appBaseUrl$uri\nHeader: $_mainHeaders');
      http.Response response = await http
          .get(
            Uri.parse(appBaseUrl + uri),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }


  Future<Response> getDummyData(
    String uri,
  ) async {
    try {
      debugPrint('====> API Call: $uri');
      http.Response response = await http.get(
        Uri.parse(uri),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $appBaseUrl$uri\nHeader: $_mainHeaders');
      debugPrint('====> API Body: $body');
      http.Response response = await http
          .post(
            Uri.parse(appBaseUrl + uri),
            body: jsonEncode(body),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      print(e.toString());
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postRefreshData(String uri) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      http.Response response = await http.post(
        Uri.parse(appBaseUrl + uri),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $refresh_token'
        },
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  // Future<Response> putData(String uri, dynamic body,
  //     {Map<String, String>? headers}) async {
  //   try {
  //     debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
  //     debugPrint('====> API Body: $body');
  //     debugPrint('====> fullurl: ${appBaseUrl + uri}');
  //     http.Response response = await http.put(
  //       // Uri.parse('${appBaseUrl + uri}'),
  //       Uri.parse(AppConstants.BASE_URL_POST + uri),
  //       //Uri.parse('https://api-gateway.project-ca.com/api/v1/account-update/110324520230001?phone_no=01716787827&email=mofiz009@gmail.com'),
  //       // body: jsonEncode(body),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $token'
  //       },
  //     ).timeout(Duration(seconds: timeoutInSeconds));
  //     return handleResponse(response, uri);
  //   } catch (e) {
  //     return const Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }

  Future<Response> deleteData(String uri,
      {Map<String, String>? headers}) async {
    try {
      debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      http.Response response = await http
          .delete(
            Uri.parse(appBaseUrl + uri),
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (e) {}
    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response0.statusCode != 200 &&
        response0.body != null &&
        response0.body is! String) {
      if (response0.body['status'] == false) {
        ErrorResponse? errorResponse;
        if (response0.statusCode != 422) {
          errorResponse = ErrorResponse.fromJson(response0.body);
        }
        response0 = Response(
            statusCode: response0.statusCode,
            body: response0.body,
            statusText: response0.statusCode != 422
                ? errorResponse!.error.message
                : response0.body['message']['password']);
      }
    } else if (response0.statusCode != 200 && response0.body == null) {
      response0 = const Response(statusCode: 0, statusText: noInternetMessage);
    }
    debugPrint(
        '====> API Response: [${response0.statusCode}] $uri\n${response0.body}');
    return response0;
  }

}

