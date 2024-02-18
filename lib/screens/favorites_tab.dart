import 'package:flutter/material.dart';
import '../shoe_model/allshoe_model.dart';
import 'detailpage/detail_page.dart';

class Ecommerce_Favorite extends StatelessWidget {
  final List<allshoes> shoesdetails = [
    allshoes(image: "assets/shoepics/NikeAirMax90.jpeg", name: "Nike Air Max 90", price: 100, desc: 'Nike Air Max 90'),
    allshoes(image: "assets/shoepics/NikeAF1Shadow.jpeg", name: "Nike AF1 Shadow", price: 130, desc: 'Nike AF1 Shadow'),
    allshoes(image: "assets/shoepics/NikeCourtLegacyNext.jpeg", name: "Nike Court Legacy Next", price: 90, desc: 'Nike Court Legacy Next'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favorites",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        actions: [
          Icon(Icons.search,color: Colors.black,size: 30,),
          SizedBox(width: 10,)
        ],
      ),
      body: GridView.builder(
          itemCount: shoesdetails.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Detail_Screen(data : allshoes(name : shoesdetails[index].name, image: shoesdetails[index].image, price: shoesdetails[index].price, desc: shoesdetails[index].desc))));
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
                      SizedBox(height: 20,),
                      Text(shoesdetails[index].name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      Text('\$${shoesdetails[index].price}',style: TextStyle(color: Colors.grey)),
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
