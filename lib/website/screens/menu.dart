import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_online_order/constants/color_constants.dart';
import 'package:web_online_order/constants/controllers.dart';
import 'package:web_online_order/constants/responsive_dart.dart';
import 'package:web_online_order/constants/text_constants.dart';
import 'package:web_online_order/screens/sidemenu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';


//
// class WebsiteCategories extends StatefulWidget {
//   const WebsiteCategories({Key key}) : super(key: key);
//
//   @override
//   _WebsiteCategoriesState createState() => _WebsiteCategoriesState();
// }
//
// class _WebsiteCategoriesState extends State<WebsiteCategories> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           height: size.height,
//           width:  size.width * 0.2,
//           child:  Obx(()=>
//             Column(
//               children: [
//             Card(
//                           color: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                           ),
//                           elevation: 20,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 Text(
//                                   'Categories',
//                                   style: TextStyle(
//                                       fontSize: 30,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.vertical,
//                   itemCount: menuController.categories.length ,
//                   itemBuilder: (BuildContext ctxt, int index) {
//
//                     return InkWell(
//                       onTap: () {
//                         setState(() {
//                           menuController.button = menuController.categories[index];
//                           for (var i = 0;
//                           i <   menuController.categories.length - 1;
//                           i++) {
//                             if (index == i) {
//                               menuController.catBgColor[i] =
//                                   Color(0xFFF57C00);
//                               menuController.catTextColor[i] = Colors.white;
//                             } else {
//                               menuController.catBgColor[i] = Colors.white;
//                               menuController.catTextColor[i] =
//                                   Color(0xFF9E9E9E);
//                             }
//                           }
//                         });
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: size.height * 0.05,
//                           padding: EdgeInsets.symmetric(
//                             horizontal: size.width * 0.02,
//                             vertical: size.height * 0.01,
//                           ),
//                           decoration: BoxDecoration(
//                             // color: Colors.green,
//                             borderRadius: BorderRadius.circular(10.0),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey[400],
//                                 blurRadius: 2.0,
//                                 spreadRadius: 0.0,
//                                 offset: Offset(2.0,
//                                     2.0), // shadow direction: bottom right
//                               )
//                             ],
//                           ),
//                           child: Text(
//                             menuController.categories[index].toString(),
//                             style: TextStyle(
//                               fontSize:Responsive.isMobile(context) ? size.width * 0.01 : size.width * 0.01,
//                               color: Colors.black,
//                               fontWeight: FontWeight.normal,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



class WebsiteMenu extends StatefulWidget {
  const WebsiteMenu({Key key}) : super(key: key);

  @override
  _WebsiteMenuState createState() => _WebsiteMenuState();
}

class _WebsiteMenuState extends State<WebsiteMenu> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
              child: Scaffold(
                drawer: SideMenu(),
                appBar: AppBar(
                  automaticallyImplyLeading: Responsive.isMobile(context) ? true : false,
                  title: Center(
                    child: Text(
                      'Website Restaurant',
                      overflow: TextOverflow.ellipsis,
                      style: headerStyle,
                    ),
                  ),
                  actions: [
                    IconButton(icon: Icon(Icons.search), onPressed: () {
                     setState(() {
                       menuController.searchButton.value = ! menuController.searchButton.value;
                     });
                    }),
                    shoppingCartBadge(),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      menuController.searchButton.value == true ?  Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: Responsive.isDesktop(context)
                              ? size.height * 0.03
                              : size.height * 0.05,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: EdgeInsets.only(
                            left: size.width * 0.012,
                            right: size.width * 0.012,
                            bottom: size.width * 0.012,
                          ),
                          child: TextFormField(
                            controller: menuController.searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                prefixIcon: Icon(Icons.search,color: Colors.black,),
                                hintText: "Search",
                                hintStyle: TextStyle(color: Colors.black)
                            ),
                          ),
                        ),
                      ) : Container(),
                      Row(
                        children: [
                        Column(
                          children: [
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 20,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Categories',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: size.width * 0.1,
                                      height: Responsive.isMobile(context)
                                          ?   size.height * 0.07
                                          : size.height * 2,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,

                                        itemCount: menuController.categories.length ,
                                        itemBuilder: (BuildContext ctxt, int index) {

                                          return
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  menuController.button = menuController.categories[index];
                                                  for (var i = 0;
                                                  i <   menuController.categories.length - 1;
                                                  i++) {
                                                    if (index == i) {
                                                      menuController.catBgColor[i] =
                                                          Color(0xFFF57C00);
                                                      menuController.catTextColor[i] = Colors.white;
                                                    } else {
                                                      menuController.catBgColor[i] = Colors.white;
                                                      menuController.catTextColor[i] =
                                                          Color(0xFF9E9E9E);
                                                    }
                                                  }
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  // width: size.width,
                                                  // height: Responsive.isMobile(context)
                                                  //     ?   size.height * 0.02
                                                  //     : size.height * 0.05,
                                                  padding: EdgeInsets.symmetric(
                                                    // horizontal: size.width * 0.02,
                                                    vertical: size.height * 0.01,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    // color: Colors.green,
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey[400],
                                                        blurRadius: 2.0,
                                                        spreadRadius: 0.0,
                                                        offset: Offset(2.0,
                                                            2.0), // shadow direction: bottom right
                                                      )
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      menuController.categories[index].toString(),
                                                      style: TextStyle(
                                                        fontSize:Responsive.isMobile(context) ? size.width * 0.01 : size.width * 0.01,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                          Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 20,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    'Items',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),

                                  Container(
                                    height: size.height,
                                    width: size.width ,
                                    child: StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection(
                                            'posshop')
                                            .doc("itemDetails")
                                            .collection('items')
                                            .orderBy('name')
                                            .snapshots(),
                                        builder:
                                            (BuildContext context, AsyncSnapshot snapshot) {
                                          var filteredDocs = [];

                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }

                                          else {
                                            for (int index = 0;
                                            index < snapshot.data.docs.length;
                                            index++) {
                                              menuController. quantity.add(1);
                                              List button = [];
                                              String searchs =
                                              snapshot.data.docs[index]['name'];
                                              button.add(snapshot.data.docs[index]['cat']);

                                              if (menuController.searchController.text
                                                  .toLowerCase()
                                                  .isNotEmpty ||
                                                  menuController.searchController.text.toLowerCase() != '') {
                                                if (searchs.toLowerCase().contains(
                                                    menuController.searchController.text.toLowerCase())) {
                                                  filteredDocs.add(snapshot.data.docs[index]);
                                                }
                                              } else {
                                                if ((menuController.button != null &&
                                                    button
                                                        .toString()
                                                        .toLowerCase()
                                                        .contains(menuController.button.toLowerCase())) ||
                                                    menuController.button == "All Items") {
                                                  filteredDocs.add(snapshot.data.docs[index]);
                                                }
                                              }
                                            }
                                          }
                                          return GridView.builder(
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                Responsive.isDesktop(context) ? 4 : 2),
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            physics: ScrollPhysics(),
                                            itemCount: filteredDocs.length,
                                            itemBuilder: (BuildContext context, int index) {
                                              // print(  filteredDocs[index]['imgUrl'],);
                                              return Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      SizedBox(
                                                        width: size.width,
                                                        height: size.height * 0.2,
                                                        child: Card(
                                                          color: Colors.white,
                                                          semanticContainer: true,
                                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                                          child:
                                                          SingleChildScrollView(
                                                            child: ListTile(
                                                              title: Text(
                                                                filteredDocs[index]['name'],style:TextStyle(fontSize: size.height * 0.04,color: Colors.black),
                                                              ),
                                                              subtitle: Text(
                                                                  filteredDocs[index]['price'].toString(),style:TextStyle(fontSize: size.height * 0.03,color: Colors.black),overflow: TextOverflow.ellipsis
                                                              ),
                                                            ),
                                                          ),
                                                          // CachedNetworkImage(useOldImageOnUrlChange: true,
                                                          //   imageUrl:  filteredDocs[index]['imgUrl'],
                                                          //   fit: BoxFit.fill,
                                                          //   placeholder: (context, url) => Image.network(  "images/wel.png",),
                                                          //   errorWidget: (context, url, error) => Icon(Icons.error),
                                                          //     width: size.width,
                                                          //     height: size.height * 0.2,
                                                          // ),
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(10.0),
                                                          ),
                                                          elevation: 20,
                                                          margin: EdgeInsets.all(10),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          bottom: size.width * 0.03,
                                                          right: size.width * 0.03,
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.black,
                                                                  blurRadius: 2.0,
                                                                  spreadRadius: 0.0,
                                                                  offset: Offset(2.0,
                                                                      2.0), // shadow direction: bottom right
                                                                )
                                                              ],
                                                            ),
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    menuController.addedToCart.contains(
                                                                        filteredDocs[index]['name'])
                                                                        ? menuController.totalValue -= 1
                                                                        : menuController.totalValue += 1;



                                                                    menuController.addedToCart.contains(
                                                                        filteredDocs[index]['name'])
                                                                        ?menuController. addedToCart
                                                                        .remove( filteredDocs[index]['name'])
                                                                        : menuController.addedToCart
                                                                        .add( filteredDocs[index]['name']);
                                                                    //
                                                                    menuController. addedToCart.contains(
                                                                        filteredDocs[index]['name'])
                                                                        ? menuController.addedPrice
                                                                        .add(filteredDocs[index]['price'])
                                                                        : menuController.addedPrice.remove(
                                                                        filteredDocs[index]['price']);

                                                                    menuController. addedToCart.contains(
                                                                        filteredDocs[index]['name'])
                                                                        ?menuController. cartPrice
                                                                        .add(filteredDocs[index]['price'])
                                                                        :menuController. cartPrice.remove(
                                                                        filteredDocs[index]['price']);

                                                                    menuController.addedToCart.contains(
                                                                        filteredDocs[index]['name'])
                                                                        ?menuController.addedQty
                                                                        .add(menuController.quantity[index])
                                                                        : menuController.addedQty.remove(
                                                                        menuController.quantity[index]);

                                                                    print(menuController.addedToCart);
                                                                    print(menuController.addedPrice);
                                                                    // print(totalValue);
                                                                    print(menuController.addedQty);
                                                                  });
                                                                },
                                                                icon: Icon(menuController.addedToCart
                                                                    .contains(filteredDocs[index]['name'])
                                                                    ? Icons.check
                                                                    : Icons.add),
                                                                color: menuController.addedToCart
                                                                    .contains(filteredDocs[index]['name'])
                                                                    ? primaryColor
                                                                    : Colors.black
                                                            ),
                                                          )),
                                                    ],
                                                  ),

                                                ],
                                              );
                                            },
                                          );
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        }
  }
Widget shoppingCartBadge() {
  return StatefulBuilder(
    builder: (context, StateSetter stateSetter) {
      return Badge(
        position: BadgePosition.topEnd(top: 0, end: 3),
        animationDuration: Duration(milliseconds: 300),
        animationType: BadgeAnimationType.slide,
        badgeContent: Text(
          menuController.totalValue.toString(),
          style: TextStyle(color: Colors.white),
        ),
        child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
         stateSetter((){
           pagesController.controller.jumpToPage(1);
         });
        }),
      );
    }
  );
}


