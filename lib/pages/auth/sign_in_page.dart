import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev/base/custom_loader.dart';
import 'package:flutter_dev/pages/auth/sign_up_page.dart';
import 'package:flutter_dev/routes/route_helper.dart';
import 'package:flutter_dev/widgets/app_text_field.dart';
import 'package:flutter_dev/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    void _login(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Type in your email address",
            title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Type in a valid email address",
            title: "Valid emaill address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password can not be less than six characters",
            title: "Password");
      } else {
        authController.login(email, password).then((status) {
          if (status.isSuccess) {
            //Get.toNamed(RouteHelper.getInitial());
            Get.toNamed(RouteHelper.getCartPage());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //app logo
                      Container(
                          height: Dimensions.screenHeight * 0.25,
                          child: Center(
                              child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            backgroundImage:
                                AssetImage("assets/image/logo_part_1.png"),
                          ))),
                      //welcome
                      Container(
                          margin: EdgeInsets.only(left: Dimensions.width20),
                          width: double.maxFinite,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hello",
                                  style: TextStyle(
                                      fontSize: Dimensions.font20 * 3 +
                                          Dimensions.font20 / 2,
                                      fontWeight: FontWeight.bold)),
                              Text("Sign into your account",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.font20,
                                  )),
                              SizedBox(
                                height: Dimensions.screenHeight * 0.05,
                              ),
                            ],
                          )),
                      //your email
                      AppTextField(
                          textController: emailController,
                          hintText: "Email",
                          icon: Icons.email),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //password
                      AppTextField(
                        textController: passwordController,
                        hintText: "Password",
                        icon: Icons.password_sharp,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //Signin Button
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                            width: Dimensions.screenWidth / 2,
                            height: Dimensions.screenHeight / 13,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius30),
                                color: AppColors.mainColor),
                            child: Center(
                              child: BigText(
                                text: "Sign In",
                                size: Dimensions.font20 + Dimensions.font20 / 2,
                                color: Colors.white,
                              ),
                            )),
                      ),
                      SizedBox(height: Dimensions.height20),
                      //sign into your account
                      Row(
                        children: [
                          Expanded(child: Container()),
                          RichText(
                              text: TextSpan(
                                  text: "Sign into your account",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.font20,
                                  ))),
                          SizedBox(
                            width: Dimensions.width20,
                          )
                        ],
                      ),
                      //tag link
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Don\'t have an account",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimensions.font20,
                            ),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.to(
                                        () => const SignUpPage(),
                                        transition: Transition.fade),
                                  text: "Create",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainBlackColor,
                                    fontSize: Dimensions.font20,
                                  ))
                            ]),
                      ),
                    ],
                  ),
                )
              : CustomLoader();
        }));
  }
}
