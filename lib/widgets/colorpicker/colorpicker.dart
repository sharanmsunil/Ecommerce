import 'package:flutter/material.dart';


class Colour_Picker extends StatefulWidget{
  final Color color;
  Colour_Picker(this.color);
  @override
  State<Colour_Picker> createState() => _Colour_PickerState();
}

class _Colour_PickerState extends State<Colour_Picker> {
  late bool isTapped = false;
  @override
  Widget build(BuildContext context,) {

    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: isTapped
              ? Border.all(color: Colors.grey, width: 4.0)
              : Border.all(color: Colors.transparent),
        ),
        child: Center(
          child: FractionallySizedBox(
            heightFactor: 0.9, // Adjust those two for the white space
            widthFactor: 0.9,
            child: Container(
              decoration: BoxDecoration(
                color: widget.color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}