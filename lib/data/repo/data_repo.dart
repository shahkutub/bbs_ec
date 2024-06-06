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
}
