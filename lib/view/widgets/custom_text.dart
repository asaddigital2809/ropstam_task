import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  Color? color;
  FontWeight? fontWeight;
  double? size;
  TextAlign? textAlign;
   CustomText({
     Key? key,
      this.text,
     this.size,
     this.fontWeight,
     this.color,
     this.textAlign
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text!,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
      ),

    );
  }
}
