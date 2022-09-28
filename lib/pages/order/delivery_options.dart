import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/order_controller.dart';
import 'package:flutter_dev/utils/dimensions.dart';
import 'package:flutter_dev/utils/styles.dart';
import 'package:get/state_manager.dart';

class DeliveryOptions extends StatelessWidget {
  final String value;
  final String title;
  final double amount;
  final bool isFree;

  const DeliveryOptions(
      {Key? key,
      required this.value,
      required this.title,
      required this.amount,
      required this.isFree})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController) {
      return Row(children: [
        Radio(
          value: value,
          groupValue: orderController.orderType,
          onChanged: (String? value) => orderController.setDeliveryType(value!),
          activeColor: Theme.of(context).primaryColor,
        ),
        SizedBox(
          width: Dimensions.width10 / 2,
        ),
        Text(title, style: robotRegular),
        SizedBox(
          width: Dimensions.width10 / 2,
        ),
        Text(
          '(${(value == 'take aways' || isFree) ? 'free' : '\$${amount / 10}'})',
          style: robotMedium.copyWith(fontSize: Dimensions.font20),
        )
      ]);
    });
  }
}
