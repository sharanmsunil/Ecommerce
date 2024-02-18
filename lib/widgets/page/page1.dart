import 'package:flutter/material.dart';
class page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/shoepics/maxresdefault.jpg"),fit: BoxFit.cover)
      ),
    );
  }
}