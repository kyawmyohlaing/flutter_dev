import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dev/routes/route_helper.dart';
import 'package:flutter_dev/utils/dimensions.dart';
import 'package:flutter_dev/widgets/account_widget.dart';
import 'package:flutter_dev/widgets/app_icon.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/cart_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white,
          ),
        ),
        body: Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(top: Dimensions.height20),
            child: Column(children: [
              //profile
              AppIcon(
                icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.height15 * 5,
                iconColor: Colors.white,
                size: Dimensions.height15 * 10,
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    //name
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimensions.height10 * 5 / 2,
                          iconColor: Colors.white,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "nway oo",
                        )),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //phone
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.phone,
                          backgroundColor: AppColors.yellowColor,
                          iconSize: Dimensions.height10 * 5 / 2,
                          iconColor: Colors.white,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "0945006666",
                        )),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //email
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.email,
                          backgroundColor: AppColors.yellowColor,
                          iconSize: Dimensions.height10 * 5 / 2,
                          iconColor: Colors.white,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "nwayoo@gmail.com",
                        )),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //address
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          backgroundColor: AppColors.yellowColor,
                          iconSize: Dimensions.height10 * 5 / 2,
                          iconColor: Colors.white,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Place your location point",
                        )),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //message
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.message,
                          backgroundColor: Colors.redAccent,
                          iconSize: Dimensions.height10 * 5 / 2,
                          iconColor: Colors.white,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Messages",
                        )),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    //name
                    GestureDetector(
                      onTap: () {
                        if (Get.find<AuthController>().userLoggedIn()) {
                          Get.find<AuthController>().clearSharedData();
                          Get.find<CartController>().clear();
                          Get.find<CartController>().clearCartHistory();
                          Get.offNamed(RouteHelper.getSignInPage());
                        } else {
                          print("you logged out");
                        }
                      },
                      child: AccountWidget(
                          appIcon: AppIcon(
                            icon: Icons.logout,
                            backgroundColor: Colors.redAccent,
                            iconSize: Dimensions.height10 * 5 / 2,
                            iconColor: Colors.white,
                            size: Dimensions.height10 * 5,
                          ),
                          bigText: BigText(
                            text: "Logout",
                          )),
                    )
                  ],
                )),
              ),
            ])));
  }
}
