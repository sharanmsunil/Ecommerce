import 'package:ecommerce/screens/favorites_tab.dart';
import 'package:ecommerce/screens/home/home_tab.dart';
import 'package:ecommerce/screens/profile_tab.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NavigatorEcommerce(),
  ));
}
class NavigatorEcommerce extends StatefulWidget {

  @override
  State<NavigatorEcommerce> createState() => _NavigatorEcommerceState();
}

class _NavigatorEcommerceState extends State<NavigatorEcommerce> {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home_Tab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomAppBar(
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen=Home_Tab();
                          currentTab=0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(currentTab == 0 ? Icons.home_filled:Icons.home_outlined,color: currentTab == 0 ? Colors.black : Colors.grey,),
                          Text('Home',style: TextStyle(color: currentTab == 0 ? Colors.black : Colors.grey),)
                        ],
                      ),),
                    SizedBox(width: 2,),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen=Center(
                            child: Text("Search"),
                          );
                          currentTab=1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(currentTab == 1 ? Icons.saved_search:Icons.search_outlined,color: currentTab == 1 ? Colors.black : Colors.grey,),
                          Text('Shop',style: TextStyle(color: currentTab == 1 ? Colors.black : Colors.grey),)
                        ],
                      ),),
                    SizedBox(width: 2,),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen=Ecommerce_Favorite();
                          currentTab=2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(currentTab == 2 ? Icons.favorite:Icons.favorite_border_outlined,color: currentTab == 2 ? Colors.black : Colors.grey,),
                          Text("Favorite",style: TextStyle(color: currentTab == 2 ? Colors.black : Colors.grey),)
                        ],
                      ),),
                    SizedBox(width: 2,),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen=Center(
                            child: Text("Bag"),
                          );
                          currentTab=3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(currentTab == 3 ? Icons.shopping_bag:Icons.shopping_bag_outlined,color: currentTab == 3 ? Colors.black : Colors.grey,),
                          Text("Bag",style: TextStyle(color: currentTab == 3 ? Colors.black : Colors.grey),)
                        ],
                      ),),
                    SizedBox(width: 2,),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen=Profile_Tab();
                          currentTab=4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(currentTab == 4 ?Icons.person_2:Icons.person_2_outlined,color: currentTab == 4 ? Colors.black : Colors.grey,),
                          Text("Profile",style: TextStyle(color: currentTab == 4 ? Colors.black : Colors.grey),)
                        ],
                      ),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
