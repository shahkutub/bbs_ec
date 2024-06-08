import 'package:bbs_ec/database/info_data_table.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database/database_helper.dart';
import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class DataRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  DataRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> storeDataToServer(InfoData srdModel) async {
    return await apiClient.postData(AppConstants.STORE_URI, srdModel.toJson());
  }

  Future<bool> updateServerStatusInDB(
      bool server, String mobile, String email) async {
    return await DatabaseHelper.instance
        .updateServerStatus(server, mobile, email);
  }

  Future<bool> storeInfoDataToDB(InfoData infoData) async {
    return await DatabaseHelper.instance.addInfoData(infoData);
  }

  Future<List<InfoData>> readInfoDataList() async {
    return await DatabaseHelper.instance.getInfoDataList();
  }

  Future<int> getOfflineDataCount() async {
    return await DatabaseHelper.instance.getOfflineDataCount();
  }

  Future<int> getTotalDataCount() async {
    return await DatabaseHelper.instance.getTotalDataCount();
  }
}
