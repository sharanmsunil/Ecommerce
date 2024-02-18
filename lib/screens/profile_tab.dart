import 'package:flutter/material.dart';

class Profile_Tab extends StatelessWidget {
  const Profile_Tab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(backgroundImage: AssetImage("assets/allshoes/check-out-the-5-best-nike-sneakers-for-dance.jpg"),),
                  Text("Edit",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("Profile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("View Profile",style: TextStyle(color: Colors.black),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Orders",style: TextStyle(color: Colors.black),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Wishlist",style: TextStyle(color: Colors.black),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Gift Cards",style: TextStyle(color: Colors.black),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                ],
              ),SizedBox(
                height: 10,
              ),
              Text("Settings",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shipping & Returns",style: TextStyle(color: Colors.black),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Help",style: TextStyle(color: Colors.black),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Contact Us",style: TextStyle(color: Colors.black),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("About Us",style: TextStyle(color: Colors.black),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
                ],
              ),
              SizedBox(height: 10,),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(350, 40),backgroundColor: Colors.grey.shade200,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    onPressed: (){}, child: Text("Log Out",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
