import 'package:flutter/material.dart';
import 'package:flutter_dev/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/pages/food/popular_food_detail.dart';
import 'package:flutter_dev/pages/food/recommended_food_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: RecommendedFoodDetail(),
      
    );
  }
}

