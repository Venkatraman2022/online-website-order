import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_online_order/constants/controllers.dart';
import 'package:web_online_order/constants/responsive_dart.dart';
import 'package:web_online_order/constants/text_constants.dart';
import 'package:web_online_order/screens/dashboard.dart';
import 'package:web_online_order/screens/sidemenu.dart';

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: Responsive.isMobile(context) ? true : false,
        title: Center(
          child: Text(
            'Demo Restaurant',
            overflow: TextOverflow.ellipsis,
            style: headerStyle,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.home), onPressed: () {
            setState(() {
              pagesController.controller.jumpToPage(0);
            });
          }),
        ],
      ),
      body: SafeArea(child: Column(
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
                        'Categories',
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
         Expanded(
           child: menuController.addedToCart.isNotEmpty ? Column(
             children: [
               Container(
                 height: size.height * 0.3,
                 child: ListView.builder(
                   shrinkWrap: true,
                   scrollDirection: Axis.vertical,
                   itemCount:   menuController.addedToCart.length,
                   itemBuilder: (BuildContext context, int index) {
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [
                           Expanded(
                               flex: 3,
                               child: Text(
                                 '\$${  menuController.cartPrice[index].toStringAsFixed(2)}',style: subtitleStyle,)),
                           Expanded(
                               flex: 3, child: Text(  menuController.addedToCart[index],style: subtitleStyle,)),
                           Expanded(
                               flex: 3,
                               child: Row(
                                 children: [
                                   IconButton(
                                       icon: Icon(Icons.remove,color: Colors.black,),
                                       onPressed: () {
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
                                       }),
                                   Text('X${  menuController.addedQty[index]}',style: subtitleStyle,),
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
                               )),
                           Expanded(
                             flex: 1,
                             child: IconButton(
                                 icon: Icon(Icons.delete,color: Colors.black,),
                                 onPressed: () {
                                   setState(() {
                                     menuController.addedToCart.removeAt(index);
                                     menuController.addedPrice.removeAt(index);
                                     menuController.totalValue -= 1;
                                     print(  menuController.totalValue);
                                     print(  menuController.addedToCart);
                                     print(  menuController.addedPrice);
                                   });
                                 }),
                           ),
                           // SizedBox(width: 10.0),
                         ],
                       ),
                     );
                   },
                 ),
               ),
               Spacer(),
               Divider(),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Text(
                     'Sub Total',
                     style: TextStyle(
                         color: Colors.black, fontWeight: FontWeight.bold),
                   ),
                   Text(
                     '\$${  menuController.cartPrice.fold(0, (previousValue, element) => previousValue + element).toStringAsFixed(2)}',
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
           ): Center(child: Text('Please add Item to your Cart',style: subtitleStyle,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)),
         )
        ],
      ),
      ),
    );
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
                                    cartController.guestUserSignInSwitch.value = false;
                                    print( cartController.guestUserSignInSwitch.value);
                                  });
                                },
                                child: Text(
                                  'Guest User',
                                  style: TextStyle(
                                    fontSize: size.height * 0.03,
                                    color:  cartController.guestUserSignInSwitch.value == false
                                        ? cartController.defaultColor
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showState(() {
                                    cartController.guestUserSignInSwitch.value = true;
                                    print( cartController.guestUserSignInSwitch.value);
                                  });
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: size.height * 0.03,
                                    color:  cartController.guestUserSignInSwitch.value == false
                                        ? Colors.black
                                        : cartController.defaultColor,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                   cartController.guestUserSignInSwitch.value == false ? guestUser() : signIn(),
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
                key: cartController.mobileKey,
                child: TextFormField(
                  validator: (String value) {
                    if (value.length < 9)
                      return " Please Enter Your Mobile Number or Sign In as Guest User";
                    else
                      return null;
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    cartController.maskFormatter,
                  ],
                  controller: cartController.mobileController,
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
                key: cartController.nameKey,
                child: TextFormField(
                  validator: (String value) {
                    if (value.length < 3)
                      return " Please Enter Your Name";
                    else
                      return null;
                  },
                  controller: cartController.nameController,
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
                cartController.mobileKey.currentState.validate();
                cartController.nameKey.currentState.validate();
                if (cartController.nameKey.currentState.validate() &&
                    cartController.mobileKey.currentState.validate()) {
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
                key: cartController.nameKey,
                child: TextFormField(
                  validator: (String value) {
                    if (value.length < 3)
                      return " Please Enter Your Name";
                    else
                      return null;
                  },
                  controller: cartController.nameController,
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
                cartController.nameKey.currentState.validate();
                if (cartController.nameKey.currentState.validate()) {
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
                                color: cartController.guestUserSignInSwitch.value == false
                                    ? cartController.defaultColor
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
                              cartController.paymentType = true;
                            });
                          },
                          child: Card(
                            elevation: 20,
                            color:   cartController.paymentType == false ? Colors.white : Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Change Payment',style: TextStyle(color: cartController.paymentType == false ? Colors.black : Colors.white),),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            showState(() {
                              cartController.paymentType = false;
                            });
                          },
                          child: Card(
                            elevation: 20,
                            color:  cartController.paymentType == false ? Colors.blue : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Place Order',style: TextStyle(color: cartController.paymentType == false ? Colors.white : Colors.black,),),
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
