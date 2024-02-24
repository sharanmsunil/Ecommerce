import 'package:ecommerce/screens/detailpage/detail_page.dart';
import 'package:ecommerce/shoe_model/allshoe_model.dart';
import 'package:flutter/material.dart';


class Home_AllTab extends StatelessWidget{
  final List<allshoes> shoesdetails = [
    allshoes(image: "assets/allshoes/air-max-90-futura-shoes-CL8cvW.jpg", name: "Nike Air Max 90", desc: "Women's Shoes - Popular", price: 150, count: 0),
    allshoes(image: "assets/allshoes/air-force-1-shadow-shoes-3d774m.png", name: "Nike AF1 Shadow", desc: "Women's Shoes - Just in", price: 130, count: 0),
    allshoes(image: "assets/allshoes/images.jpeg", name: "Nike Court Legacy", desc: "Women's Shoes", price: 150, count: 0),
    allshoes(image: "assets/allshoes/download.jpeg", name: "Nike Court Legacy Next", desc: "Women's Shoes", price: 100, count: 0),
    allshoes(image: "assets/allshoes/123-joyride-cdp-apla-xa-xp.jpg", name: "Nike Joyride Run Flyknit", desc: "Choose Your Joyride", price: 200, count: 0),
    allshoes(image: "assets/allshoes/check-out-the-5-best-nike-sneakers-for-dance.jpg", name: "Nike Air Force 1s", desc: "For a Staple in Hip-Hop", price: 120, count: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: shoesdetails.length,
        itemBuilder: (context,index){
          return InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Detail_Screen(data : allshoes(name : shoesdetails[index].name, image: shoesdetails[index].image, desc: shoesdetails[index].desc, price: shoesdetails[index].price, count: 0))));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child:
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(image: AssetImage(shoesdetails[index].image),fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(shoesdetails[index].name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Text(shoesdetails[index].desc,style: TextStyle(color: Colors.grey),),
                    Text('\$${shoesdetails[index].price}',style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
            ),
          );
        }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height /1.4),),),
    );
  }

}