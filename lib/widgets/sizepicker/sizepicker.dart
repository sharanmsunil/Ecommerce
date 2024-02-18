import 'package:flutter/material.dart';

class Size_Picker extends StatefulWidget{
  final int size;
  Size_Picker(this.size);
  @override
  State<Size_Picker> createState() => _Size_PickerState();
}

class _Size_PickerState extends State<Size_Picker> {
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
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: isTapped
                ? Colors.grey.shade300
                :  Colors.transparent,
            border: Border.all(color: Colors.grey.shade300)
        ),
        child: Center(
          child: Text(widget.size.toString(),style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}