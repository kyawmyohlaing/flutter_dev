import 'package:flutter/material.dart';
import 'package:flutter_dev/routes/route_helper.dart';
import 'package:flutter_dev/utils/app_constants.dart';
import 'package:flutter_dev/utils/dimensions.dart';
import 'package:flutter_dev/widgets/app_icon.dart';
import 'package:flutter_dev/utils/colors.dart';
import 'package:flutter_dev/widgets/big_text.dart';
import 'package:flutter_dev/widgets/small_text.dart';
import 'package:flutter_dev/widgets/icon_and_text_widget.dart';
import 'package:flutter_dev/widgets/expandable_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/recommended_product_controller.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    //print("page is id " + pageId.toString());
    //print("product name is" + product.name.toString());
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: AppIcon(icon: Icons.clear)),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  child: Center(
                      child: BigText(
                          size: Dimensions.font26, text: product.name!)),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20),
                      topLeft: Radius.circular(Dimensions.radius20),
                    ),
                  ),
                ),
              ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    child: ExpandableTextWidget(text: product.description!),
                    margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(
                  text: " \$ ${product.price!} " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
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
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      )),
                  Container(
                    padding: EdgeInsets.only(
                      left: Dimensions.height20,
                      right: Dimensions.height20,
                      top: Dimensions.width20,
                      bottom: Dimensions.width20,
                    ),
                    child: BigText(
                        text: "\$10 | Add to cart", color: Colors.white),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                  ),
                ]),
          )
        ]));
  }
}
