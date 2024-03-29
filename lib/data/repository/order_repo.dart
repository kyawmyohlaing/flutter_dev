import 'package:flutter_dev/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../models/place_order_model.dart';
import '../../utils/app_constants.dart';

class OrderRepo {
  final ApiClient apiClient;
  OrderRepo({required this.apiClient});

  Future<Response> placeOrder(PlaceOrderBody placeOrder) async {
    return await apiClient.postData(
        AppConstants.PLACE_ORDER_URI, placeOrder.toString());
  }

  Future<Response> getOrderList() async {
    return await apiClient.getData(AppConstants.ORDER_LIST_URI);
  }
}
