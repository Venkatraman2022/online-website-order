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
import 'package:web_online_order/website/constants/controllers.dart';


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
                                          ?   size.height
                                          : size.height ,
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
                          Expanded(
                            flex: 2,
                            child: Card(
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
                                            return ListView.builder(
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
                                                        SingleChildScrollView(
                                                          child:
                                                          Padding(
                                                            padding: const EdgeInsets.all(12.0),
                                                            child: Row(
                                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                              Expanded(
                                                                flex:5,
                                                                child: Text(
                                                                    filteredDocs[index]['name'],style:TextStyle(fontSize: size.height * 0.02,color: Colors.black),
                                                                  ),
                                                              ),
                                                              Expanded(
                                                                flex:1,
                                                                child: Text(
                                                                        filteredDocs[index]['price'].toString(),style:TextStyle(fontSize: size.height * 0.02,color: Colors.black),overflow: TextOverflow.ellipsis
                                                                    ),
                                                              ),
                                                                Expanded(
                                                                  flex:1,
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
                                                                            : Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                          // ListTile(
                                                          //   title:
                                                          //   subtitle:
                                                          // ),
                                                        ),

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
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                            'Your Orders',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              menuController.addedToCart.isNotEmpty ?    Container(
                                height: size.height,
                                width: size.width * 0.2,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: menuController.addedToCart.length,
                                    itemBuilder: (BuildContext context, int index){
                                  return
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex:2,
                                              child: Text(
                                                '\$${  menuController.cartPrice[index].toStringAsFixed(2)}',style:TextStyle(fontSize: size.height * 0.02,color: Colors.black),overflow: TextOverflow.ellipsis),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(  menuController.addedToCart[index],style:TextStyle(fontSize: size.height * 0.02,color: Colors.black),overflow: TextOverflow.ellipsis),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                        onPressed: (){
                                                          setState(() {
                                                            print('index$index');
                                                            if (  menuController.addedQty[index] > 1) {
                                                              print('index$index');
                                                              menuController.   addedQty[index]--;
                                                              menuController.cartPrice[index] =
                                                                  menuController. cartPrice[index] -
                                                                      menuController.  addedPrice[index];
                                                              print(  menuController.cartPrice);
                                                              print(  menuController.addedQty[index]);

                                                              print(  menuController.cartPrice[index]);
                                                              print(  menuController.addedPrice[index]);
                                                            }
                                                          });
                                                        },
                                                        icon: Icon(Icons.remove,color: Colors.black,),),
                                                      Text('X${  menuController.addedQty[index]}',style:TextStyle(fontSize: size.height * 0.02,color: Colors.black),overflow: TextOverflow.ellipsis),
                                                      IconButton(
                                                          icon: Icon(Icons.add,color: Colors.black,),
                                                          onPressed: () {
                                                            setState(() {
                                                              menuController. addedQty[index]++;
                                                              menuController. cartPrice[index] =
                                                                  menuController.  addedPrice[index] *
                                                                      menuController.    addedQty[index];
                                                              print(  menuController.cartPrice[index]);
                                                              print(  menuController.addedPrice[index]);
                                                            });
                                                          }),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: IconButton(
                                                  icon: Icon(Icons.delete,color: Colors.black,),
                                                  onPressed: () {
                                                    setState(() {
                                                      menuController.addedToCart.removeAt(index);
                                                      menuController.addedPrice.removeAt(index);
                                                      menuController.cartPrice.removeAt(index);
                                                      menuController.totalValue -= 1;
                                                      print(  menuController.totalValue);
                                                      print(  menuController.addedToCart);
                                                      print(  menuController.addedPrice);
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                      );
                                }),
                              )
                                  : Center(child: Text('Please add Item to your Cart',style:TextStyle(fontSize: size.height * 0.02,color: Colors.black),overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,maxLines: 2,),),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Sub Total',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '   \$${  menuController.cartPrice.fold(0, (previousValue, element) => previousValue + element).toStringAsFixed(2)}',
                                    style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    signInPopup();
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 2.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(
                                              2.0, 2.0), // shadow direction: bottom right
                                        )
                                      ],
                                      borderRadius: BorderRadius.all(Radius.circular(12))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Check Out'),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        }
  signInPopup() {
    Size size = MediaQuery.of(context).size;
    return Get.defaultDialog(
        backgroundColor: Colors.white,
        title: 'CheckOut',
        content: SizedBox(
          height: size.height * 0.5,
          child: Card(
            color: Colors.white,
            elevation: 20,
            child:
            StatefulBuilder(builder: (context, StateSetter showState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black,
                          size: size.height * 0.03,
                        ),
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
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
                          borderRadius:
                          BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  showState(() {
                                    websiteCartController.guestUserSignInSwitch.value = false;
                                    print( websiteCartController.guestUserSignInSwitch.value);
                                  });
                                },
                                child: Text(
                                  'Guest User',
                                  style: TextStyle(
                                    fontSize: size.height * 0.03,
                                    color:  websiteCartController.guestUserSignInSwitch.value == false
                                        ? websiteCartController.defaultColor
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showState(() {
                                    websiteCartController.guestUserSignInSwitch.value = true;
                                    print( websiteCartController.guestUserSignInSwitch.value);
                                  });
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: size.height * 0.03,
                                    color:  websiteCartController.guestUserSignInSwitch.value == false
                                        ? Colors.black
                                        : websiteCartController.defaultColor,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    websiteCartController.guestUserSignInSwitch.value == false ? guestUser() : signIn(),
                  ],
                ),
              );
            }),
          ),
        ));
  }
  signIn() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: websiteCartController.mobileKey,
                child: TextFormField(
                  validator: (String value) {
                    if (value.length < 9)
                      return " Please Enter Your Mobile Number or Sign In as Guest User";
                    else
                      return null;
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    websiteCartController.maskFormatter,
                  ],
                  controller: websiteCartController.mobileController,
                  autofillHints: [AutofillHints.telephoneNumber],
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintText: 'Mobile No.\*',
                    hintStyle: subtitleStyle,
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      size: size.width * 0.04,
                      color: Colors.black54,
                    ),
                  ),
                  style: subtitleStyle,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: websiteCartController.nameKey,
                child: TextFormField(
                  validator: (String value) {
                    if (value.length < 3)
                      return " Please Enter Your Name";
                    else
                      return null;
                  },
                  controller: websiteCartController.nameController,
                  textCapitalization: TextCapitalization.words,
                  autofillHints: [AutofillHints.givenName],
                  decoration: InputDecoration(
                    hintStyle: subtitleStyle,
                    hintText: 'Name\*',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      size: size.width * 0.04,
                      color: Colors.black54,
                    ),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                  ),
                  style: subtitleStyle,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(
              onTap: () {
                websiteCartController.mobileKey.currentState.validate();
                websiteCartController.nameKey.currentState.validate();
                if (websiteCartController.nameKey.currentState.validate() &&
                    websiteCartController.mobileKey.currentState.validate()) {
                  paymentMethod();
                }
              },
              child: Card(
                elevation: 20,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Continue'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  guestUser() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: websiteCartController.nameKey,
                child: TextFormField(
                  validator: (String value) {
                    if (value.length < 3)
                      return " Please Enter Your Name";
                    else
                      return null;
                  },
                  controller: websiteCartController.nameController,
                  textCapitalization: TextCapitalization.words,
                  autofillHints: [AutofillHints.givenName],
                  decoration: InputDecoration(
                    hintStyle: subtitleStyle,
                    hintText: 'Name\*',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(
                      Icons.person_outline,
                      size: size.width * 0.04,
                      color: Colors.black54,
                    ),
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.teal)),
                  ),
                  style: subtitleStyle,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(
              onTap: () {
                websiteCartController.nameKey.currentState.validate();
                if (websiteCartController.nameKey.currentState.validate()) {
                  paymentMethod();
                }
              },
              child: Card(
                elevation: 20,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Continue'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  paymentMethod() {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet(
        isDismissible: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 20,
        context: context,
        builder: (context) => SizedBox(
          height: size.height * 0.5,
          child: Card(
            color: Colors.white,
            child:
            StatefulBuilder(builder: (context, StateSetter showState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                2.0, 2.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black,
                          size: size.height * 0.03,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      height: size.height * 0.06,
                      width: size.width * 0.4,
                      // margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
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
                          borderRadius:
                          BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Center(
                            child: Text(
                              'Pay at Counter',
                              style: TextStyle(
                                fontSize: size.height * 0.03,
                                color: websiteCartController.guestUserSignInSwitch.value == false
                                    ? websiteCartController.defaultColor
                                    : Colors.black,
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Center(
                      child: Text(
                        'You have Elected to pay at the counter. Place the place order button to proceed',
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        style: subtitleStyle,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            showState(() {
                              websiteCartController.paymentType = true;
                            });
                          },
                          child: Card(
                            elevation: 20,
                            color:   websiteCartController.paymentType == false ? Colors.white : Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Change Payment',style: TextStyle(color: websiteCartController.paymentType == false ? Colors.black : Colors.white),),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            showState(() {
                              websiteCartController.paymentType = false;
                            });
                          },
                          child: Card(
                            elevation: 20,
                            color:  websiteCartController.paymentType == false ? Colors.blue : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Place Order',style: TextStyle(color: websiteCartController.paymentType == false ? Colors.white : Colors.black,),),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            }),
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


