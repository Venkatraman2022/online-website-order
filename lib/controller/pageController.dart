import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesController extends GetxController {
  static PagesController instance = Get.find();
  // RxList<UserModel> users = RxList<UserModel>([]);
  RxInt pageindex = 0.obs;
  final PageController controller = PageController(initialPage: 0);
  String collection = "users";

  @override
  onReady() {
    super.onReady();
    // users.bindStream(getAllOrders());
  }


}
