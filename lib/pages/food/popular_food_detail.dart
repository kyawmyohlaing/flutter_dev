import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/cart_controller.dart';
import 'package:flutter_dev/controllers/popular_product_controller.dart';
import 'package:flutter_dev/models/products_model.dart';
import 'package:flutter_dev/routes/route_helper.dart';
import 'package:flutter_dev/utils/app_constants.dart';
import 'package:flutter_dev/utils/dimensions.dart';
import 'package:flutter_dev/widgets/app_icon.dart';
import 'package:flutter_dev/utils/colors.dart';
import 'package:flutter_dev/widgets/big_text.dart';
import 'package:flutter_dev/widgets/app_column.dart';
import 'package:flutter_dev/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>());
    //print("page is id " + pageId.toString());
    //print("product name is" + product.name.toString());
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
                          image: NetworkImage(AppConstants.BASE_URL +
                              AppConstants.UPLOAD_URL +
                              product.img!))),
                )),
            //icon widgets
            Positioned(
                top: Dimensions.height45,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.initial);
                          },
                          child: AppIcon(icon: Icons.arrow_back_ios)),
                      AppIcon(icon: Icons.shopping_cart_outlined)
                    ])),
            //introduction of food detail
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
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
                    AppColumn(text: product.name!),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(text: product.description!),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (popularProduct) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width30,
              right: Dimensions.width30,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius20 * 2),
                topLeft: Radius.circular(Dimensions.radius20 * 2),
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white),
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              popularProduct.setQuantity(false);
                            },
                            child: Icon(
                              Icons.remove,
                              color: AppColors.signColor,
                            )),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        BigText(text: popularProduct.quantity.toString()),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        GestureDetector(
                            onTap: () {
                              popularProduct.setQuantity(true);
                            },
                            child: Icon(
                              Icons.add,
                              color: AppColors.signColor,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: Dimensions.height20,
                      right: Dimensions.height20,
                      top: Dimensions.width20,
                      bottom: Dimensions.width20,
                    ),
                    child: GestureDetector(
                        onTap: () {
                          popularProduct.addItem(product);
                        },
                        child: BigText(
                            text: "\$ ${product.price!} | Add to cart",
                            color: Colors.white)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                  )
                ]),
          );
        }));
  }
}
