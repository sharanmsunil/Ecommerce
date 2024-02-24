import 'dart:math';

import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/screens/checkout_page/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Cart_Page extends StatefulWidget {

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: Transform.rotate(
              angle: 45 * pi / 180,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.add,
                  size: 30,
                ),
              )),
          title: Text(
            "Shopping Bag",
          ),
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        body: Consumer(
          builder: (BuildContext context, CartProvider cartProvider, Widget? child) {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               cartProvider.cart_list.isNotEmpty? Expanded(
                  child: ListView.builder(itemCount: cartProvider.cart_list.length,itemBuilder: (context,index){
                    var selectedProduct = cartProvider.cart_list[index];
                    return
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(image: AssetImage(
                                cartProvider.cart_list[index].image), fit: BoxFit.cover)
                        ),
                      ),
                      Container(
                        width: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartProvider.cart_list[index].name, style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),),
                            Text("Size: 8", style: TextStyle(color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),),
                            Text('\$${cartProvider.cart_list[index].price}', style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade100,
                                  minimumSize: Size.fromRadius(5),
                                  shape: CircleBorder()),
                              onPressed: () {
                                setState(() {
                                  if (cartProvider.cart_list[index].count >= 1) {
                                    cartProvider.cart_list[index].count--;
                                    cartProvider.calculatePrice();
                                  } else if(cartProvider.cart_list[index].count<1){
                                    cartProvider.removeFromWishList(selectedProduct);
                                  }
                                });
                              },
                              child: Text("-",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black))),
                          Text(cartProvider.cart_list[index].count.toString(),
                            style: TextStyle(fontSize: 20, color: Colors
                                .black),),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade100,
                                  minimumSize: Size.fromRadius(5),
                                  shape: CircleBorder()),
                              onPressed: () {
                                setState(() {
                                  if (cartProvider.cart_list[index].count < 10) {
                                    cartProvider.cart_list[index].count++;
                                    cartProvider.calculatePrice();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Center(child: Text(
                                          "Limit has reached", style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10),)),
                                          backgroundColor: Colors.black,));
                                  }
                                });
                              },
                              child: Text("+",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black))),
                        ],
                      ),
                    ],
                  ),
                );
                  }),
                ):  Center(child: Text("Cart is Empty",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal", style: TextStyle(color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),),
                      Text(cartProvider.total.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.black))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: TextStyle(color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),),
                      Text(cartProvider.total.toString(),
                          style: TextStyle(fontSize: 15, color: Colors.black))
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Consumer(
                          builder: (BuildContext context, CartProvider cartProvider, Widget? child) {
                            return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                minimumSize: Size(300, 50),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Checkout_Page(
                                        subtotal: cartProvider.total, count: cartProvider.totalcount,)));
                            },
                            child: Text("Checkout", style: TextStyle(color: Colors
                                .white, fontWeight: FontWeight.bold),));
            }),
                    ),
                  ),
                )
              ],
            );
          })
    );
  }
}
