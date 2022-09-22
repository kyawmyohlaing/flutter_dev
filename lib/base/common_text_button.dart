import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/big_text.dart';

class CommonTextButton extends StatelessWidget {
  final String text;
  const CommonTextButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.height20,
        right: Dimensions.height20,
        top: Dimensions.width20,
        bottom: Dimensions.width20,
      ),
      child: Center(child: BigText(text: text, color: Colors.white)),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 10,
              color: AppColors.mainColor.withOpacity(0.3))
        ],
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: AppColors.mainColor,
      ),
    );
  }
}
