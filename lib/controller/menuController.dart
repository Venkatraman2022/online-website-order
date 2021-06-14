import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MenuController extends GetxController {
  static MenuController instance = Get.find();
  RxList categories = [].obs;
  RxBool searchButton = false.obs;
  TextEditingController searchController = TextEditingController();
  RxInt current = 0.obs;
  RxList<dynamic> addedToCart = [].obs;
  RxList<dynamic> addedPrice = [].obs;
  RxList<dynamic> cartPrice = [].obs;
  RxList<dynamic> addedQty = [].obs;
  RxList<dynamic> quantity = [].obs;
  int totalValue = 0;
  String button = "All Items";
  List<Color> catBgColor = [
    Color(0xFFF57C00),
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  List<Color> catTextColor = [
    Colors.white,
    Color(0xFF9E9E9E),
    Color(0xFF9E9E9E),
    Color(0xFF9E9E9E),
    Color(0xFF9E9E9E),
    Color(0xFF9E9E9E),
    Color(0xFF9E9E9E),
    Color(0xFF9E9E9E),
  ];
   List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
   getCategories() => FirebaseFirestore.instance
      .collection('posshop')
      .doc('categories')
      .collection('category')
      .get().then((value) => value.docs.forEach((element) {
        categories.add(element.get('category'));
   }));
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getCategories();
  }
}