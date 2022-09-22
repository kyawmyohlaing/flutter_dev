import 'package:flutter/material.dart';
import '../utils/dimensions.dart';
import '../utils/styles.dart';

class PaymentOptionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final int index;
  const PaymentOptionButton(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subTitle,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: Dimensions.height10 / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20 / 4),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[200]!, blurRadius: 5, spreadRadius: 1)
            ]),
        child: ListTile(
          leading: Icon(
            icon,
            size: 40,
            color: Theme.of(context).disabledColor,
          ),
          title: Text(
            title,
            style: robotMedium.copyWith(fontSize: Dimensions.font20),
          ),
          subtitle: Text(subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: robotRegular.copyWith(
                color: Theme.of(context).disabledColor,
                fontSize: Dimensions.font16,
              )),
          trailing: Icon(
            Icons.check_circle,
            color: Theme.of(context).primaryColor,
          ),
        ));
  }
}
