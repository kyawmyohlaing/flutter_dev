import 'package:flutter/material.dart';
import 'package:flutter_dev/base/no_data_page.dart';
import 'package:flutter_dev/controllers/cart_controller.dart';
import 'package:flutter_dev/controllers/location_controller.dart';
import 'package:flutter_dev/pages/home/main_food_page.dart';
import 'package:flutter_dev/routes/route_helper.dart';
import 'package:flutter_dev/utils/app_constants.dart';
import 'package:flutter_dev/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
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
            GetBuilder<CartController>(
              builder: (_cartController) {
                return _cartController.getItems.length > 0
                    ? Positioned(
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
                                child: GetBuilder<CartController>(
                                    builder: (cartController) {
                                  var _cartList = cartController.getItems;
                                  return ListView.builder(
                                      itemCount: _cartList.length,
                                      itemBuilder: (_, index) {
                                        return Container(
                                            height: Dimensions.height20 * 5,
                                            width: double.maxFinite,
                                            child: Row(children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    var popularIndex = Get.find<
                                                            PopularProductController>()
                                                        .popularProductList
                                                        .indexOf(
                                                            _cartList[index]
                                                                .product!);
                                                    if (popularIndex >= 0) {
                                                      Get.toNamed(RouteHelper
                                                          .getPopularFood(
                                                              popularIndex,
                                                              "cartpage"));
                                                    } else {
                                                      var recommendedIndex = Get
                                                              .find<
                                                                  RecommendedProductController>()
                                                          .recommendedProductList
                                                          .indexOf(
                                                              _cartList[index]
                                                                  .product!);
                                                      if (recommendedIndex <
                                                          0) {
                                                        Get.snackbar(
                                                          "History product",
                                                          "Product review is not available for history products",
                                                          backgroundColor:
                                                              AppColors
                                                                  .mainColor,
                                                          colorText:
                                                              Colors.white,
                                                        );
                                                      } else {
                                                        Get.toNamed(RouteHelper
                                                            .getRecommendedFood(
                                                                recommendedIndex,
                                                                "cartpage"));
                                                      }
                                                    }
                                                  },
                                                  child: Container(
                                                      width:
                                                          Dimensions.height20 *
                                                              5,
                                                      height:
                                                          Dimensions.height20 *
                                                              5,
                                                      margin: EdgeInsets.only(
                                                          bottom: Dimensions
                                                              .height10),
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                              AppConstants
                                                                      .BASE_URL +
                                                                  AppConstants
                                                                      .UPLOAD_URL +
                                                                  cartController
                                                                      .getItems[
                                                                          index]
                                                                      .img!,
                                                            )),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                Dimensions
                                                                    .radius20),
                                                        color: Colors.white,
                                                      ))),
                                              SizedBox(
                                                width: Dimensions.width20,
                                              ),
                                              Expanded(
                                                  child: Container(
                                                      height:
                                                          Dimensions.height20 *
                                                              5,
                                                      //color: Colors.white,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          BigText(
                                                            text: cartController
                                                                .getItems[index]
                                                                .name!,
                                                            color:
                                                                Colors.black54,
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
                                                                      .getItems[
                                                                          index]
                                                                      .price
                                                                      .toString(),
                                                                  color: Colors
                                                                      .redAccent),
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                  left: Dimensions
                                                                      .height10,
                                                                  right: Dimensions
                                                                      .height10,
                                                                  top: Dimensions
                                                                      .width10,
                                                                  bottom:
                                                                      Dimensions
                                                                          .width10,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(Dimensions
                                                                            .radius20),
                                                                    color: Colors
                                                                        .white),
                                                                child: Row(
                                                                  children: [
                                                                    GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          cartController.addItem(
                                                                              _cartList[index].product!,
                                                                              -1);
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .remove,
                                                                          color:
                                                                              AppColors.signColor,
                                                                        )),
                                                                    SizedBox(
                                                                      height: Dimensions
                                                                          .height10,
                                                                    ),
                                                                    BigText(
                                                                        text: _cartList[index]
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
                                                                        onTap:
                                                                            () {
                                                                          cartController.addItem(
                                                                              _cartList[index].product!,
                                                                              1);
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .add,
                                                                          color:
                                                                              AppColors.signColor,
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
                    : NoDataPage(text: "Your cart is empty!");
              },
            )
          ],
        ),
        bottomNavigationBar:
            GetBuilder<CartController>(builder: (cartController) {
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
              child: cartController.getItems.length > 0
                  ? Row(
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
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigText(
                                    text: "\$" +
                                        cartController.totalAmount.toString()),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (Get.find<AuthController>().userLoggedIn()) {
                                //cartController.addToHistory();
                                if (Get.find<LocationController>()
                                    .addressList
                                    .isEmpty) {
                                  Get.toNamed(RouteHelper.getAddressPage());
                                }
                              } else {
                                Get.toNamed(RouteHelper.getSignInPage());
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                left: Dimensions.height20,
                                right: Dimensions.height20,
                                top: Dimensions.width20,
                                bottom: Dimensions.width20,
                              ),
                              child: BigText(
                                  text: "Check Out", color: Colors.white),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: AppColors.mainColor,
                              ),
                            ),
                          )
                        ])
                  : Container());
        }));
  }
}
