import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dev/utils/dimensions.dart';
import 'package:flutter_dev/widgets/account_widget.dart';
import 'package:flutter_dev/widgets/app_icon.dart';

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
                          text: "NwayOo",
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
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimensions.height10 * 5 / 2,
                          iconColor: Colors.yellow,
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
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimensions.height10 * 5 / 2,
                          iconColor: Colors.yellow,
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
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimensions.height10 * 5 / 2,
                          iconColor: Colors.red,
                          size: Dimensions.height10 * 5,
                        ),
                        bigText: BigText(
                          text: "Place your location point",
                        )),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                  ],
                )),
              ),
            ])));
  }
}
