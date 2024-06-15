import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  ButtonView({
    required this.onTap,
    required this.buttonName,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadiuss,
    this.textColor,
    this.textSize,
    this.textFontWeight,
    this.topMargin,
    this.bottomMargin,
    this.rightMargin,
    this.leftMargin,
    this.alignment,
    this.bottomPadding,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
  });

  VoidCallback onTap;
  String? buttonName;
  double? buttonHeight;
  double? buttonWidth;
  Color? buttonColor;
  Color? borderColor;
  double? borderWidth;
  double? borderRadiuss;
  Color? textColor;
  double? textSize;
  FontWeight? textFontWeight;
  double? rightMargin;
  double? topMargin;
  double? bottomMargin;
  double? leftMargin;
  double? leftPadding;
  double? topPadding;
  double? bottomPadding;
  double? rightPadding;
  Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: rightMargin ?? 0,
          top: topMargin ?? 0,
          bottom: bottomMargin ?? 0,
          left: leftMargin ?? 0),

      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.only(
                right: rightPadding ?? 0,
                top: topPadding ?? 0,
                bottom: bottomPadding ?? 0,
                left: leftPadding ?? 0),
            alignment: alignment ?? Alignment.center,
            decoration: BoxDecoration(
              color: buttonColor ?? Colors.white,
              border: Border.all(
                color: borderColor ?? Colors.black,
                width: borderWidth ?? 0,
              ),
              borderRadius: BorderRadius.circular(borderRadiuss ?? 30),
            ),
            height: buttonHeight ?? 45,
            width: buttonWidth ?? MediaQuery.of(context).size.width / 1.5,
            child: Text(
              buttonName ?? "ButtonName",
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: textSize ?? 15,
                fontWeight: textFontWeight ?? FontWeight.normal,
              ),
            )),
      ),
    );
  }
}
