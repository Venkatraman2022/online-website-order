import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_online_order/controller/menuController.dart';
import 'package:web_online_order/website/cart/cart_controller.dart';
import 'package:web_online_order/website/controller/menuController.dart';
import 'package:web_online_order/website/screens/dashboard.dart';

import 'cart/cart_controller.dart';
import 'constants/color_constants.dart';
import 'constants/firebase_constants.dart';
import 'controller/pageController.dart';
import 'screens/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(PagesController());
    Get.put(MenuController());
    Get.put(CartController());
    Get.put(WebsiteCartController());
    Get.put(WebsiteMenuController());
    // Get.put(LocationController());
    // Get.put(RestaurantController());
    // Get.put(FoodController());
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Online Order',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
      ),
      home:
        WebsiteHomePage(),
      // MyHomePage(),
    );
  }
}

