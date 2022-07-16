
import 'package:flutter/material.dart';
import 'package:flutter_dev/utils/dimensions.dart';
import 'package:flutter_dev/widgets/app_icon.dart';
import 'package:flutter_dev/utils/colors.dart';
import 'package:flutter_dev/widgets/big_text.dart';
import 'package:flutter_dev/widgets/small_text.dart';
import 'package:flutter_dev/widgets/icon_and_text_widget.dart';
import 'package:flutter_dev/widgets/app_column.dart';



class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/image/unsplash1.jpg"
                  )
                )
              ),
            )
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ]
            )
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize-20,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Burmese Side"),
                  SizedBox(height: Dimensions.height10,),
                  BigText(text: "Introduce"),
                ]
              )
           )
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(
          top:Dimensions.height30,
          bottom:Dimensions.height30,
          left:Dimensions.width30,
          right:Dimensions.width30,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20*2),
                  topLeft: Radius.circular(Dimensions.radius20*2),
                ),
        )
      )
    );
  }
}