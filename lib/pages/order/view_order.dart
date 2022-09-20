import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/order_controller.dart';
import 'package:get/get.dart';

import '../../models/order_model.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class ViewOrder extends StatelessWidget {
  final bool isCurrent;
  const ViewOrder({Key? key, required this.isCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<OrderController>(builder: (orderController) {
      if (orderController.isLoading == false) {
        late List<OrderModel> orderList;
        if (orderController.currentOrderList.isNotEmpty) {
          orderList = isCurrent
              ? orderController.currentOrderList.reversed.toList()
              : orderController.historyOrderList.reversed.toList();
        }
        //return Text(orderList.length.toString());
        return SizedBox(
            width: Dimensions.screenWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10 / 2,
                  vertical: Dimensions.width10 / 2),
              child: ListView.builder(
                itemCount: orderList.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () => null,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("#order ID     " +
                              orderList[index].id.toString()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20 / 4)),
                                  child: Container(
                                      margin: EdgeInsets.all(
                                          Dimensions.height10 / 2),
                                      child: Text(
                                        '${orderList[index].orderStatus}',
                                        style: TextStyle(color: Colors.white),
                                      ))),
                              SizedBox(
                                height: Dimensions.height10 / 2,
                              ),
                              InkWell(
                                  onTap: () => null,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20 / 4)),
                                        child: Container(
                                          margin: EdgeInsets.all(
                                              Dimensions.height10 / 2),
                                          child: Text("Track Order"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      )
                                    ],
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ));
      } else {
        return Text("loading");
      }
    }));
  }
}
