import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/order_controller.dart';
import 'package:flutter_dev/utils/styles.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';
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
                          Row(
                            children: [
                              Text("#order ID     ",
                                  style: robotRegular.copyWith(
                                      fontSize: Dimensions.font12)),
                              SizedBox(width: Dimensions.width10 / 2),
                              Text('#{orderList[index].id.toString()}')
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20 / 4)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimensions.width10,
                                      vertical: Dimensions.width10 / 2),
                                  child: Text(
                                    '${orderList[index].orderStatus}',
                                    style: robotMedium.copyWith(
                                        fontSize: Dimensions.font12,
                                        color: Theme.of(context).cardColor),
                                  )),
                              SizedBox(
                                height: Dimensions.height10 / 2,
                              ),
                              InkWell(
                                  onTap: () => null,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.width10 / 2,
                                            vertical: Dimensions.width10 / 2),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius20 / 4),
                                          border: Border.all(
                                            width: 1,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/image/tracking.png",
                                              width: 15,
                                              height: 15,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            SizedBox(
                                                width: Dimensions.width10 / 2),
                                            Text(
                                              "track order",
                                              style: robotMedium.copyWith(
                                                  fontSize: Dimensions.font12,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            )
                                          ],
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
        return CustomLoader();
      }
    }));
  }
}
