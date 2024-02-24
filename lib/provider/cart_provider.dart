import 'package:flutter/material.dart';

import '../shoe_model/allshoe_model.dart';

final List<allshoes> shoesdetails = [
  ///homeall
  allshoes(image: "assets/allshoes/air-max-90-futura-shoes-CL8cvW.jpg", name: "Nike Air Max 90", desc: "Women's Shoes - Popular", price: 150, count: 0),
  allshoes(image: "assets/allshoes/air-force-1-shadow-shoes-3d774m.png", name: "Nike AF1 Shadow", desc: "Women's Shoes - Just in", price: 130, count: 0),
  allshoes(image: "assets/allshoes/images.jpeg", name: "Nike Court Legacy", desc: "Women's Shoes", price: 150, count: 0),
  allshoes(image: "assets/allshoes/download.jpeg", name: "Nike Court Legacy Next", desc: "Women's Shoes", price: 100, count: 0),
  allshoes(image: "assets/allshoes/123-joyride-cdp-apla-xa-xp.jpg", name: "Nike Joyride Run Flyknit", desc: "Choose Your Joyride", price: 200, count: 0),
  allshoes(image: "assets/allshoes/check-out-the-5-best-nike-sneakers-for-dance.jpg", name: "Nike Air Force 1s", desc: "For a Staple in Hip-Hop", price: 120, count: 0),
  ///jordan
  allshoes(image: "assets/allshoes/download.jpeg", name: "Nike Joyride Run Flyknit", desc: "Choose Your Joyride",price: 200, count: 0),
  allshoes(image: "assets/shoepics/air-max-90-futura-shoes-CL8cvW.jpg",name: "Nike Air Max 90", desc: "Choose Your Joyride",price: 80, count: 0),
  allshoes(image: "assets/allshoes/123-joyride-cdp-apla-xa-xp.jpg",name: "Nike Joyride Run Flyknit", desc: "Choose Your Joyride",price: 200, count: 0),
  ///favorite
  allshoes(image: "assets/shoepics/NikeAirMax90.jpeg", name: "Nike Air Max 90", price: 100, desc: 'Nike Air Max 90', count: 0),
  allshoes(image: "assets/shoepics/NikeAF1Shadow.jpeg", name: "Nike AF1 Shadow", price: 130, desc: 'Nike AF1 Shadow', count: 0),
  allshoes(image: "assets/shoepics/NikeCourtLegacyNext.jpeg", name: "Nike Court Legacy Next", price: 90, desc: 'Nike Court Legacy Next', count: 0),
];

class CartProvider extends ChangeNotifier{
  final List<allshoes> _shoes = shoesdetails;
  List<allshoes> get shoes => _shoes;
  List<allshoes> allProducts = shoesdetails;
  int price=0;
  int total=0;
  int totalcount=0;

  final List<allshoes> _cart = [];
  List<allshoes> get cart_list => _cart;



  void addToWishList (allshoes selectedProduct) {
    _cart.add(selectedProduct);
    notifyListeners();
  }

  void removeFromWishList(allshoes selectedProduct){
    _cart.remove(selectedProduct);
    notifyListeners();
  }


  void calculatePrice(){
    total =0;
    totalcount =0;
    for(int i =0;i<cart_list.length;i++){
      price = cart_list[i].price;
      total = (price*cart_list[i].count)+total;
      totalcount = cart_list[i].count+totalcount;
    }
  }
}