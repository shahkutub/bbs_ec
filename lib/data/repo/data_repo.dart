import 'dart:convert';

import 'package:bbs_ec/data/model/store_request_data_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class DataRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  DataRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> storeDataToServer(StoreRequestDataModel srdModel) async {
    return await apiClient.postData(AppConstants.STORE_URI, srdModel.toJson());
  }

  Future<bool> storeDataToLocalServer(StoreRequestDataModel srdModel) async {
    StoreLocalData sld = getDataFromLocalServer();
    List<StoreRequestDataModel> dataList = sld.data ?? [];
    dataList.add(srdModel);
    sld.data = dataList;
    return await sharedPreferences.setString(
        AppConstants.ARRAY_DATA, json.encode(sld.toJson()));
  }

  StoreLocalData getDataFromLocalServer() {
    String getData = sharedPreferences.getString(AppConstants.ARRAY_DATA) ?? '';
    if (getData.isEmpty) {
      return StoreLocalData();
    }
    return StoreLocalData.fromJson(json.decode(getData));
  }
}
