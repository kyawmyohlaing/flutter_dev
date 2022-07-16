import 'package:flutter/material.dart';
import 'package:flutter_dev/utils/colors.dart';
import 'package:flutter_dev/widgets/big_text.dart';
import 'package:flutter_dev/widgets/small_text.dart';
import 'package:flutter_dev/pages/home/food_page_body.dart';
import 'package:flutter_dev/utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    //print("current height is "+MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Burma", color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(text: "Yangon", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded),
                        ]
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search, color: Colors.white, size: Dimensions.iconSize24,),
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                        ),
                    )
                  )
                ],
              )

            )
      
          ),
          //showing the body
          Expanded(
            child: SingleChildScrollView(
            child: FoodPageBody(),
            )
          ),
        ]
      )
    );
      
    }
}