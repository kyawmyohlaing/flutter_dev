import 'package:flutter_dev/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  late ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData("/api/v1/products/popular");
  }
}
