import 'dart:math';

import 'package:flutter/material.dart';

class Checkout_Page extends StatefulWidget {
  int subtotal;
  int count;
  Checkout_Page({super.key,required this.subtotal,required this.count});

  @override
  State<Checkout_Page> createState() => _Checkout_PageState();
}

class _Checkout_PageState extends State<Checkout_Page> {
  int delivery = 0;
  double taxes =73.93;
  double total=0;
  @override
  void initState() {
    setState(() {
      total = taxes+widget.subtotal;
    });
    super.initState();
  }

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
          "Checkout",
        ),
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                    Text("San Francisci, 94109",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("750 Sutter Street, Apt 3",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_outlined,color: Colors.black,))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery method",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                    Text(widget.count>1 ? "${widget.count} pieces" : "${widget.count} piece",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("Free Delivery",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_outlined,color: Colors.black,))
              ],
            ),
          ),Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Payment",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                    Text("511 Grant Avenue, Flat 23B, San Francisco",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                    Text("Visa (****2319)",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                  ],
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_outlined,color: Colors.black,))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Promo code",
                hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                  borderSide: BorderSide(color: Colors.grey.shade300,width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                  borderSide: BorderSide(color: Colors.grey.shade300,width: 3),
                ),
                contentPadding: EdgeInsets.symmetric(
                    vertical: 20, horizontal: 30),
                suffixIcon: Icon(Icons.check,color: Colors.grey,)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                Text("\$${widget.subtotal}",style: TextStyle(fontSize: 15,color: Colors.black))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                Text("\$${delivery}",style: TextStyle(fontSize: 15,color: Colors.black))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                Text("\$${taxes}",style: TextStyle(fontSize: 15,color: Colors.black))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                Text("\$${total}",style: TextStyle(fontSize: 15,color: Colors.black))
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black,minimumSize: Size(300, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                    onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Order Placed Succesfully",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),)),backgroundColor: Colors.black,));
                    }, child: Text("Checkout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
              ),
            ),
          )
        ],
      )
    );
  }
}
