import 'package:flutter_dev/models/signup_body_model.dart';
import 'package:flutter_dev/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.PostData(
        AppConstants.REGISTATION_URI, signUpBody.toJson());
  }
}
