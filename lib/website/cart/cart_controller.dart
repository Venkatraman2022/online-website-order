import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:web_online_order/constants/firebase_constants.dart';
import 'package:web_online_order/modals/menu_modals.dart';


class WebsiteCartController extends GetxController {
  static WebsiteCartController instance = Get.find();
  RxBool guestUserSignInSwitch = false.obs;
  Color defaultColor = Colors.blue;
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+61 (##) ####-####', filter: {"#": RegExp(r'[0-9]')});
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  var nameKey = GlobalKey<FormState>();
  var mobileKey = GlobalKey<FormState>();
  bool paymentType = false;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
}