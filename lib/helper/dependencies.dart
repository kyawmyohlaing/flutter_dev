import 'package:flutter_dev/controller/popular_product_controller.dart';
import 'package:flutter_dev/data/repository/popular_product_repo.dart';
import 'package:flutter_dev/data/api/api_client.dart';
import 'package:get/get.dart';



Future<void> init() async {

   //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.dbestech.com"));
  //repos
  Get.lazyPut(() =>PopularProductRepo(apiClient: Get.find(), ApiClient: null));
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
