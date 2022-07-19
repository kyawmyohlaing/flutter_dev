import 'package:flutter/material.dart';
import 'package:flutter_dev/controllers/popular_product_controller.dart';
import 'package:flutter_dev/pages/home/food_page_body.dart';
import 'package:flutter_dev/pages/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:flutter_dev/pages/food/recommended_food_detail.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
    );
  }
}
