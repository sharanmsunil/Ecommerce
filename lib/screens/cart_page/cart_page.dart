import 'dart:math';

import 'package:ecommerce/screens/checkout_page/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../shoe_model/allshoe_model.dart';

class Cart_Page extends StatefulWidget {
  final allshoes data;

  Cart_Page({super.key, required this.data});

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  int count =1;
  int price = 150;
  int total=0;
  @override
  void initState() {
    findtotal();
    super.initState();
  }
  void findtotal() {
    setState(() {
      price = widget.data.price;
      total = count*price;
    });
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
          "Shopping Bag",
        ),
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
      ),
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Expanded(
          //   child: ListView.builder(itemCount: 1,itemBuilder: (context,index){
          //     return
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 150,
                        width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(image: AssetImage(widget.data.image),fit: BoxFit.cover)
                      ),
                    ),
                    Container(
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.data.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                          Text("Size: 8",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
                          Text('\$${widget.data.price}',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 15),),
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
                                if(count>0){
                                  count--;
                                  findtotal();
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Limit has reached",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),)),backgroundColor: Colors.black,));
                                }
                              });
                            },
                            child: Text("-",
                                style: TextStyle(fontSize: 20, color: Colors.black))),
                        Text("${count}",style: TextStyle(fontSize: 20,color: Colors.black),),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade100,
                                minimumSize: Size.fromRadius(5),
                                shape: CircleBorder()),
                            onPressed: () {
                              setState(() {
                                if(count<10){
                                  count++;
                                  findtotal();
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("Limit has reached",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),)),backgroundColor: Colors.black,));
                                }
                              });
                            },
                            child: Text("+",
                                style: TextStyle(fontSize: 20, color: Colors.black))),
                      ],
                    ),
                  ],
                ),
              ),
          //   }),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                Text("\$${total}",style: TextStyle(fontSize: 15,color: Colors.black))
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Checkout_Page(subtotal: total, count: count,)));
                    }, child: Text("Checkout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
              ),
            ),
          )
        ],
      )
    );
  }
}
