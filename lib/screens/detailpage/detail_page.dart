import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/screens/detailpage/details.dart';
import 'package:ecommerce/screens/cart_page/cart_page.dart';
import 'package:ecommerce/shoe_model/allshoe_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/colorpicker/colorpicker.dart';
import '../../widgets/page/page1.dart';
import '../../widgets/page/page2.dart';
import '../../widgets/sizepicker/sizepicker.dart';
import 'package:badges/badges.dart' as badges;

class Detail_Screen extends StatefulWidget {
  final allshoes data;

  Detail_Screen({super.key, required this.data});

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  final _controller = PageController();
  late bool isTapped = false;
  final List<Detail> _details = getDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            badges.Badge(
              badgeStyle: badges.BadgeStyle(
                badgeColor: Colors.transparent,
              ),
                badgeContent: Consumer<CartProvider>(
              builder: (BuildContext context, CartProvider cartprovider,
                  Widget? child) {
                return Text(cartprovider.cart_list.length.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),);
              },
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Cart_Page()));
            },),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView(
                      controller: _controller,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(widget.data.image),
                          )),
                        ),
                        page1(),
                        page2(),
                        page1(),
                        page2(),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 5,
                      effect: SwapEffect(
                          activeDotColor: Colors.white,
                          dotColor: Colors.grey,
                          dotWidth: 10,
                          dotHeight: 10),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  widget.data.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  '\$${widget.data.price}',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    Colour_Picker(Colors.black),
                    SizedBox(
                      width: 10,
                    ),
                    Colour_Picker(Colors.lightBlue),
                    SizedBox(
                      width: 10,
                    ),
                    Colour_Picker(Colors.purple.shade200),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    Size_Picker(5),
                    SizedBox(
                      width: 10,
                    ),
                    Size_Picker(6),
                    SizedBox(
                      width: 10,
                    ),
                    Size_Picker(7),
                    SizedBox(
                      width: 10,
                    ),
                    Size_Picker(8),
                    SizedBox(
                      width: 10,
                    ),
                    Size_Picker(9),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: _expandScreen(),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<CartProvider>(builder: (BuildContext context,
                      CartProvider cartprovider, Widget? child) {
                    var selectedProduct = widget.data;
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade100,
                            minimumSize: Size(150, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          if (!cartprovider.cart_list
                              .contains(selectedProduct)) {
                            cartprovider.addToWishList(selectedProduct);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(
                                  child: Text(
                                "Added to Bag",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              )),
                              backgroundColor: Colors.white,
                            ));
                          } else if(cartprovider.cart_list.contains(selectedProduct)){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(
                                  child: Text(
                                "Already Added to Bag",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              )),
                              backgroundColor: Colors.white,
                            ));
                          }
                        },
                        child: Text(
                          "Add to Bag",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ));
                  }),
                  SizedBox(
                    width: 20,
                  ),
                  Consumer<CartProvider>(builder: (BuildContext context,
                      CartProvider cartprovider, Widget? child) {
                    // var selectedProduct = widget.data;
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: Size(150, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Cart_Page()));
                        },
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ));
                  })
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }

  Widget _expandScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ExpansionPanelList(
        animationDuration: Duration(milliseconds: 500),
        dividerColor: Colors.grey.shade300,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _details[index].isExpanded = isExpanded;
          });
        },
        children: _details.map<ExpansionPanel>((Detail details) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  details.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              );
            },
            body: ListTile(
              title: Text(
                details.body,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            isExpanded: details.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}
