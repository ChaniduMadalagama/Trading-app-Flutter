import 'package:flutter/material.dart';

Widget SizedBoxView ({ double? height , double? width , Widget? widget})
{
  return SizedBox(
    height: height,
    width: width,
    child: widget,
  );
}

 Widget DividerView ({double? height, double? thickness, Color? color, double? indent, double? endIndent})
 {
    return Divider(
      height: height ?? 1,
      thickness: thickness ?? 0,
      color: color ?? Colors.black,
      indent: indent ?? 0,
      endIndent: endIndent ?? 0,
    );
 }

