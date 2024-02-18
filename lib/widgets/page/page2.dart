import 'package:flutter/material.dart';

class page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/shoepics/nike_wmns_womens_air_max_90_1_white_neutral_grey_black_university_red_aq1273_100_8.jpg"),fit: BoxFit.cover)
      ),
    );
  }
}
