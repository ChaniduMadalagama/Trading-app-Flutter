import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  String text;
  Color? textColor;
  double? textSize;
  FontWeight? fontWeight;

  TextView({
    required this.text,
    this.textColor,
    this.textSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontWeight: fontWeight,
        overflow: TextOverflow.clip
      ),
    );
  }
}
