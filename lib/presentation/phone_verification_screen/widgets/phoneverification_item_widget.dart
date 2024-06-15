import 'package:flutter/material.dart';
import 'package:prayas_capital/core/app_export.dart';

// ignore: must_be_immutable
class PhoneverificationItemWidget extends StatelessWidget {
  const PhoneverificationItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123.h,
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 1.v,
      ),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Text(
        "1",
        style: theme.textTheme.headlineSmall,
      ),
    );
  }
}
