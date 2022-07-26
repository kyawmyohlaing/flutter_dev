import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/cart_controller.dart';
import 'package:flutter_dev/pages/home/main_food_page.dart';
import 'package:flutter_dev/routes/route_helper.dart';
import 'package:flutter_dev/utils/app_constants.dart';
import 'package:flutter_dev/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            )),
        Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                //color: Colors.red,
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child:
                        GetBuilder<CartController>(builder: (cartController) {
                      var _cartList = cartController.getItems;
                      return ListView.builder(
                          itemCount: _cartList.length,
                          itemBuilder: (_, index) {
                            return Container(
                                height: Dimensions.height20 * 5,
                                width: double.maxFinite,
                                child: Row(children: [
                                  Container(
                                      width: Dimensions.height20 * 5,
                                      height: Dimensions.height20 * 5,
                                      margin: EdgeInsets.only(
                                          bottom: Dimensions.height10),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD_URL +
                                                  cartController
                                                      .getItems[index].img!,
                                            )),
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    width: Dimensions.width20,
                                  ),
                                  Expanded(
                                      child: Container(
                                          height: Dimensions.height20 * 5,
                                          //color: Colors.white,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              BigText(
                                                text: cartController
                                                    .getItems[index].name!,
                                                color: Colors.black54,
                                              ),
                                              SmallText(
                                                text: "Spicy",
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  BigText(
                                                      text: cartController
                                                          .getItems[index].price
                                                          .toString(),
                                                      color: Colors.redAccent),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                      left: Dimensions.height10,
                                                      right:
                                                          Dimensions.height10,
                                                      top: Dimensions.width10,
                                                      bottom:
                                                          Dimensions.width10,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimensions
                                                                    .radius20),
                                                        color: Colors.white),
                                                    child: Row(
                                                      children: [
                                                        GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .signColor,
                                                            )),
                                                        SizedBox(
                                                          height: Dimensions
                                                              .height10,
                                                        ),
                                                        BigText(
                                                            text: _cartList[
                                                                    index]
                                                                .quantity
                                                                .toString() //popularProduct
                                                            //.inCartItems
                                                            //.toString()
                                                            ),
                                                        SizedBox(
                                                          height: Dimensions
                                                              .height10,
                                                        ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color: AppColors
                                                                  .signColor,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )))
                                ]));
                          });
                    }))))
      ],
    ));
  }
}
