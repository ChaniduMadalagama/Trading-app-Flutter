import 'package:flutter/material.dart';

class TextFielsView extends StatelessWidget {
  TextEditingController controller;
  String? hintText;
  int? maxLength;
  TextStyle? textStyle;
  double? borderRadius;

  TextInputType? keyboardType;

  VoidCallback? onTap;
  VoidCallback? onChanged;

  Color? cursorColor;

  TextFielsView({
    required this.controller,
    this.hintText,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.maxLength,
    this.textStyle,
    this.cursorColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: () => onTap,
      onChanged: (value) => onChanged,
      keyboardType: keyboardType,
      maxLength: maxLength,
      style: textStyle,
      cursorColor: cursorColor,
      decoration: InputDecoration(
     //   hintText: hintText ?? "hint text",
        label:hintText == null ? Text('Set Fund') : Text(hintText!),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
      ),
    );
  }
}
