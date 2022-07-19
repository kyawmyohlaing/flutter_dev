
import 'package:flutter/material.dart';
import 'package:flutter_dev/utils/dimensions.dart';
import 'package:flutter_dev/widgets/app_icon.dart';
import 'package:flutter_dev/utils/colors.dart';
import 'package:flutter_dev/widgets/big_text.dart';
import 'package:flutter_dev/widgets/small_text.dart';
import 'package:flutter_dev/widgets/icon_and_text_widget.dart';
import 'package:flutter_dev/widgets/app_column.dart';
import 'package:flutter_dev/widgets/expandable_text_widget.dart';



class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
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
          //icon widgets
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
          //introduction of food detail
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
                  SizedBox(height: Dimensions.height10,),
                  Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "These pictures are part of a set of photos that were taken towards the end of the summer to realize one of my projects that was close to my heart: making a calendar for the coming year. Because I like to admire the colour and textures, vegetables are an excellent choice because they can offer a whole show for the eyes all year round!These pictures are part of a set of photos that were taken towards the end of the summer to realize one of my projects that was close to my heart: making a calendar for the coming year. Because I like to admire the colour and textures, vegetables are an excellent choice because they can offer a whole show for the eyes all year round!These pictures are part of a set of photos that were taken towards the end of the summer to realize one of my projects that was close to my heart: making a calendar for the coming year. Because I like to admire the colour and textures, vegetables are an excellent choice because they can offer a whole show for the eyes all year round!These pictures are part of a set of photos that were taken towards the end of the summer to realize one of my projects that was close to my heart: making a calendar for the coming year. Because I like to admire the colour and textures, vegetables are an excellent choice because they can offer a whole show for the eyes all year round!These pictures are part of a set of photos that were taken towards the end of the summer to realize one of my projects that was close to my heart: making a calendar for the coming year. Because I like to admire the colour and textures, vegetables are an excellent choice because they can offer a whole show for the eyes all year round!These pictures are part of a set of photos that were taken towards the end of the summer to realize one of my projects that was close to my heart: making a calendar for the coming year. Because I like to admire the colour and textures, vegetables are an excellent choice because they can offer a whole show for the eyes all year round!"),
                    
                    ),   
                  ),           
                ],
              ),
           ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
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
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.height20, 
                right: Dimensions.height20, 
                top: Dimensions.width20, 
                bottom: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(height: Dimensions.height10,),
                  BigText(text: "0"),
                  SizedBox(height: Dimensions.height10,),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              )
            ),
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.height20, 
                right: Dimensions.height20, 
                top: Dimensions.width20, 
                bottom: Dimensions.width20,
              ),
              child: BigText(text: "\$10 | Add to cart", color: Colors.white),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            ),
          ]
        ),
      )
    );
  }
}