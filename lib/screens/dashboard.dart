
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_online_order/cart/cart.dart';
import 'package:web_online_order/constants/controllers.dart';
import 'package:web_online_order/constants/responsive_dart.dart';

import 'menu.dart';
import 'sidemenu.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      // drawer:  SideMenu(),
      body: StatefulBuilder(
        builder: (context, StateSetter stateSetter) {
          return SafeArea(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child: SideMenu(),
                ),
              // SizedBox(
              //   width: 16.0,
              // ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: PageView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (value) {
                      pagesController.pageindex.value = value;
                    },
                    controller: pagesController.controller,
                    children: [
                      // DashboardScreen(),
                      // ProductsScreen(),
                      // CategoriesPage(),
                      // OrdersPage(),
                      // OffersPage(),
                      // UsersPage(),
                      Menu(),
                      Cart(),
                    ]),
              ),
            ]),
          );
        }
      ),
    );
  }
}
