import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/pages/auth/sign_up_page.dart';
import 'package:flutter_dev/widgets/app_text_field.dart';
import 'package:flutter_dev/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                    backgroundImage: AssetImage("assets/image/logo_part_1.png"),
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
                              fontSize:
                                  Dimensions.font20 * 3 + Dimensions.font20 / 2,
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
                  icon: Icons.password_sharp),
              SizedBox(
                height: Dimensions.height20,
              ),
              //Signin Button
              Container(
                  width: Dimensions.screenHeight / 2,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius30),
                      color: AppColors.mainColor),
                  child: Center(
                    child: BigText(
                      text: "Sign In",
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                      color: Colors.white,
                    ),
                  )),
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
                            ..onTap = () => Get.to(() => const SignUpPage(),
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
        ));
  }
}
