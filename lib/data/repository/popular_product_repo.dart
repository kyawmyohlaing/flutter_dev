import 'package:flutter_dev/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  late ApiClient apiClient;

  PopularProductRepo({required this.apiClient, required ApiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData("end point url");
  }
}
